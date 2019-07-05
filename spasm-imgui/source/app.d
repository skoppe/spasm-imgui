import imgui.funcs;
import imgui.types;
import spasm.spa;
import spasm.types;
import spasm.bindings.webgl;
import std.algorithm : move;

@safe:
nothrow:

mixin Spa!App;

alias GL = WebGLRenderingContextBase;

struct State {
  Optional!(WebGLUniformLocation) g_AttribLocationTex;
  Optional!(WebGLUniformLocation) g_AttribLocationProjMtx;
  GLint g_AttribLocationPosition;
  GLint g_AttribLocationUV;
  GLint g_AttribLocationColor;
  WebGLBuffer g_VboHandle;
  WebGLTexture g_FontTexture;
  WebGLBuffer g_ElementsHandle;
}

__gshared State state;

struct Canvas {
  mixin Node!"canvas";
  @prop id = "canvas";
  @prop width = 800;
  @prop height = 480;
}

struct App {
  nothrow:
  @child Canvas canvas;
  WebGLProgram g_ShaderHandle;
  WebGLRenderingContextBase gl;
  bool dirty;
  void onMount() @trusted {
    addCss("body{margin:0}");
    initCanvas();
    ImGuiIO* io = igGetIO();
    canvas.node.addEventListener("mousemove",(event){
        import spasm.bindings.uievents : MouseEvent;
        io.MousePos = ImVec2(cast(float)event.as!(MouseEvent).pageX-canvas.node.offsetLeft, cast(float)event.as!MouseEvent.pageY-canvas.node.offsetTop);
        setDirty();
      });
    canvas.node.addEventListener("mousedown",(event){
        io.MouseDown[0] = true;
        setDirty();
      });
    canvas.node.addEventListener("mouseup",(event){
        io.MouseDown[0] = false;
        setDirty();
      });
    canvas.node.addEventListener("wheel",(event){
        import spasm.bindings.uievents : WheelEvent;
        double deltaY = event.as!(WheelEvent).deltaY;
        io.MouseWheel = deltaY * -0.03;
        setDirty();
        event.preventDefault();
      });
    render(0);
  }
  void setDirty() {
    if (dirty)
      return;
    dirty = true;
    window.requestAnimationFrame(&this.render);
  }
  void initCanvas() @trusted {
    igCreateContext(null);
    ImGuiIO* io = igGetIO();
    ImFontAtlas_AddFontDefault(io.Fonts);
    // io.Fonts.AddFontDefault();
    io.KeyMap[ImGuiKey_Tab] = 41;
    io.IniFilename = null;

    float ratio = 1.0f;//cast(float)canvas.height / canvas.width;
    io.DisplayFramebufferScale = ImVec2(ratio, ratio);
    io.DisplaySize = ImVec2(cast(float)canvas.width, cast(float)canvas.height);
    import std.algorithm : move;
    this.gl = canvas.node.getContext("webgl").front.move.trustedGet!(WebGLRenderingContext).move.as!WebGLRenderingContextBase;

    // Backup GL state
    auto last_texture = gl.getParameter(GL.TEXTURE_BINDING_2D).as!WebGLTexture;
    auto last_array_buffer = gl.getParameter(GL.ARRAY_BUFFER_BINDING).as!WebGLBuffer;

    enum string vertex_shader =
      "uniform mat4 ProjMtx;\n"~
      "attribute vec2 Position;\n"~
      "attribute vec2 UV;\n"~
      "attribute vec4 Color;\n"~
      "varying vec2 Frag_UV;\n"~
      "varying vec4 Frag_Color;\n"~
      "void main()\n"~
      "{\n"~
      "	Frag_UV = UV;\n"~
      "	Frag_Color = Color;\n"~
      "	gl_Position = ProjMtx * vec4(Position.xy,0,1);\n"~
      "}\n";

    enum string fragment_shader =
      "precision mediump float;\n"~
      "uniform sampler2D Texture;\n"~
      "varying vec2 Frag_UV;\n"~
      "varying vec4 Frag_Color;\n"~
      "void main()\n"~
      "{\n"~
      "	gl_FragColor = Frag_Color * texture2D(Texture, Frag_UV);\n"~
      "}\n";

    this.g_ShaderHandle = gl.createProgram().front().move();
    auto g_VertHandle = gl.createShader(GL.VERTEX_SHADER);
    auto g_FragHandle = gl.createShader(GL.FRAGMENT_SHADER);
    gl.shaderSource(g_VertHandle, vertex_shader);
    gl.shaderSource(g_FragHandle, fragment_shader);
    gl.compileShader(g_VertHandle);
    gl.compileShader(g_FragHandle);
    gl.attachShader(g_ShaderHandle, g_VertHandle);
    gl.attachShader(g_ShaderHandle, g_FragHandle);
    gl.linkProgram(g_ShaderHandle);

    state.g_AttribLocationTex = gl.getUniformLocation(g_ShaderHandle, "Texture");
    state.g_AttribLocationProjMtx = gl.getUniformLocation(g_ShaderHandle, "ProjMtx");
    state.g_AttribLocationPosition = gl.getAttribLocation(g_ShaderHandle, "Position");
    state.g_AttribLocationUV = gl.getAttribLocation(g_ShaderHandle, "UV");
    state.g_AttribLocationColor = gl.getAttribLocation(g_ShaderHandle, "Color");

    state.g_VboHandle = gl.createBuffer().front().move();
    state.g_ElementsHandle = gl.createBuffer().front().move();

    // Build texture
    ubyte* pixels;
    int width, height;
    ImFontAtlas_Build(io.Fonts);
    ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, &pixels, &width, &height);
    auto typedPixels = ()@trusted {return Uint8Array.create((cast(ubyte*)pixels)[0..width*height*4]);} ();
    auto sumTypedPixels = SumType!(Int8Array, Int16Array, Int32Array, Uint8Array, Uint16Array, Uint32Array, Uint8ClampedArray, Float32Array, Float64Array, DataView)(typedPixels.move);

    // Create OpenGL texture
    state.g_FontTexture = gl.createTexture().front().move();
    gl.bindTexture(GL.TEXTURE_2D, state.g_FontTexture);
    gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST); // GL_NEAREST
    gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);
    gl.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, sumTypedPixels);

    // Store our identifier
    // TODO: really needed??
    // io.Fonts->TexID = (void *)(intptr_t)g_FontTexture;

    // Cleanup (don't clear the input data if you want to append new fonts later)
    ImFontAtlas_ClearInputData(io.Fonts);
    ImFontAtlas_ClearTexData(io.Fonts);

    // Restore modified GL state
    gl.bindTexture(GL.TEXTURE_2D, last_texture);
    gl.bindBuffer(GL.ARRAY_BUFFER, last_array_buffer);
  }
  void newFrame() {
    igNewFrame();
  }
  void endFrame() {
    dirty = false;
  }
  void render(double step) {
    newFrame();
    igShowDemoWindow();
    igRender();
    int width = canvas.width;
    int height = canvas.height;
    gl.viewport(0, 0, width, height);
    gl.clearColor(0.2f, 0.2f, 0.2f, 1.0f);
    gl.clear(GL.COLOR_BUFFER_BIT);
    render(igGetDrawData(), width, height);
    endFrame();
  }
  void render(ImDrawData* draw_data, int width, int height) @trusted {
    ImGuiIO* io = igGetIO();
    io.DisplaySize.x = width;
    io.DisplaySize.y = height;
    float fb_width = io.DisplaySize.x * io.DisplayFramebufferScale.x;
    float fb_height = io.DisplaySize.y * io.DisplayFramebufferScale.y;

    if(fb_width == 0 || fb_height == 0)
      return;

    draw_data.ScaleClipRects(io.DisplayFramebufferScale);

    auto last_program = gl.getParameter(GL.CURRENT_PROGRAM).as!(WebGLProgram);
    auto last_texture = gl.getParameter(GL.TEXTURE_BINDING_2D).as!(WebGLTexture);
    auto last_array_buffer = gl.getParameter(GL.ARRAY_BUFFER_BINDING).as!(WebGLBuffer);
    auto last_element_array_buffer = gl.getParameter(GL.ELEMENT_ARRAY_BUFFER_BINDING).as!(WebGLBuffer);

    gl.enable(GL.BLEND);
    gl.blendEquation(GL.FUNC_ADD);
    gl.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);
    gl.disable(GL.CULL_FACE);
    gl.disable(GL.DEPTH_TEST);
    gl.enable(GL.SCISSOR_TEST);
    gl.activeTexture(GL.TEXTURE0);
    gl.viewport(0, 0, cast(int)fb_width, cast(int)fb_height);

    const float[16] ortho_projection =
      [
       2.0f/io.DisplaySize.x, 0.0f,                   0.0f, 0.0f,
       0.0f,                  2.0f/-io.DisplaySize.y, 0.0f, 0.0f,
       0.0f,                  0.0f,                  -1.0f, 0.0f,
       -1.0f,                  1.0f,                   0.0f, 1.0f
       ];
    auto projection = Float32Array.create(ortho_projection[]);

    gl.useProgram(g_ShaderHandle.toOpt);
    gl.uniform1i(state.g_AttribLocationTex, 0);
    gl.uniformMatrix4fv(state.g_AttribLocationProjMtx, false, projection);

    gl.bindBuffer(GL.ARRAY_BUFFER, state.g_VboHandle);
    gl.enableVertexAttribArray(state.g_AttribLocationPosition);
    gl.enableVertexAttribArray(state.g_AttribLocationUV);
    gl.enableVertexAttribArray(state.g_AttribLocationColor);

    gl.vertexAttribPointer(state.g_AttribLocationPosition, 2, GL.FLOAT, false, ImDrawVert.sizeof, ImDrawVert.pos.offsetof);
    gl.vertexAttribPointer(state.g_AttribLocationUV, 2, GL.FLOAT, false, ImDrawVert.sizeof, ImDrawVert.uv.offsetof);
    gl.vertexAttribPointer(state.g_AttribLocationColor, 4, GL.UNSIGNED_BYTE, true, ImDrawVert.sizeof, ImDrawVert.col.offsetof);

    gl.bindBuffer(GL.ARRAY_BUFFER, state.g_VboHandle);
    gl.bindBuffer(GL.ELEMENT_ARRAY_BUFFER, state.g_ElementsHandle);

    foreach (n; 0..draw_data.CmdListsCount) {
      ImDrawList* cmd_list = draw_data.CmdLists[n];
      ImDrawIdx idx_buffer_offset = 0;

      auto countVertices = cmd_list.VtxBuffer.Size;
      auto countIndices = cmd_list.IdxBuffer.Size;

      auto vertexBuffer = DataView.create((cast(ubyte*)cmd_list.VtxBuffer.Data)[0..ImDrawVert.sizeof * cmd_list.VtxBuffer.Size]);
      auto indexBuffer = DataView.create((cast(ubyte*)cmd_list.IdxBuffer.Data)[0..ImDrawIdx.sizeof * cmd_list.IdxBuffer.Size]);

      auto vBuffer = Optional!(BufferDataSource)(BufferDataSource(vertexBuffer.move()));
      auto iBuffer = Optional!(BufferDataSource)(BufferDataSource(indexBuffer.move()));

      gl.bufferData(GL.ARRAY_BUFFER, vBuffer, GL.STREAM_DRAW);
      gl.bufferData(GL.ELEMENT_ARRAY_BUFFER, iBuffer, GL.STREAM_DRAW);

      auto cmdCnt = cmd_list.CmdBuffer.Size;

      foreach (i; 0..cmdCnt) {
        ImDrawCmd* pcmd = &cmd_list.CmdBuffer.Data[i];
        if (pcmd.UserCallback) {
          pcmd.UserCallback(cmd_list, pcmd);
        }
        else
          {
            gl.bindTexture(GL.TEXTURE_2D, state.g_FontTexture); // TODO: is this the font texture?
            gl.scissor(cast(int)pcmd.ClipRect.x, cast(int)(fb_height - pcmd.ClipRect.w), cast(int)(pcmd.ClipRect.z - pcmd.ClipRect.x), cast(int)(pcmd.ClipRect.w - pcmd.ClipRect.y));
            gl.drawElements(GL.TRIANGLES, cast(GLsizei)pcmd.ElemCount, GL.UNSIGNED_SHORT, idx_buffer_offset);
          }
        idx_buffer_offset += pcmd.ElemCount * ushort.sizeof;
      }
    }

    // Restore modified state
    gl.disableVertexAttribArray(state.g_AttribLocationPosition);
    gl.disableVertexAttribArray(state.g_AttribLocationUV);
    gl.disableVertexAttribArray(state.g_AttribLocationColor);
    gl.useProgram(last_program.toOpt);
    gl.bindTexture(GL.TEXTURE_2D, last_texture);
    gl.bindBuffer(GL.ARRAY_BUFFER, last_array_buffer);
    gl.bindBuffer(GL.ELEMENT_ARRAY_BUFFER, last_element_array_buffer);
    gl.disable(GL.SCISSOR_TEST);
  }
}


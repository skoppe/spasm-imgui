// File is autogenerated with `dub spasm:webidl -- --bindgen`
import {spasm as spa, encoders as encoder, decoders as decoder} from '../modules/spasm.js';
let spasm = spa;
let memory = {};
const setupMemory = () => {
    let buffer = spasm.memory.buffer;
    if (memory.heapi32s && !memory.heapi32s.length === 0)
        return;
    memory.heapi32s = new Int32Array(buffer)
    memory.heapi32u = new Uint32Array(buffer)
    memory.heapi16s = new Int16Array(buffer)
    memory.heapi16u = new Uint16Array(buffer)
    memory.heapi8s = new Int8Array(buffer)
    memory.heapi8u = new Uint8Array(buffer)
    memory.heapf32 = new Float32Array(buffer)
    memory.heapf64 = new Float64Array(buffer)
}
const setBool = (ptr, val) => (memory.heapi32u[ptr/4] = +val),
      setInt = (ptr, val) => (memory.heapi32s[ptr/4] = val),
      setUInt = (ptr, val) => (memory.heapi32u[ptr/4] = val),
      setShort = (ptr, val) => (memory.heapi16s[ptr/2] = val),
      setUShort = (ptr, val) => (memory.heapi16u[ptr/2] = val),
      setByte = (ptr, val) => (memory.heapi8s[ptr] = val),
      setUByte = (ptr, val) => (memory.heapi8u[ptr] = val),
      setFloat = (ptr, val) => (memory.heapf32[ptr/4] = val),
      setDouble = (ptr, val) => (memory.heapf64[ptr/8] = val),
      getBool = (ptr) => memory.heapi32u[ptr/4],
      getInt = (ptr) => memory.heapi32s[ptr/4],
      getUInt = (ptr) => memory.heapi32u[ptr/4],
      getShort = (ptr) => memory.heapi16s[ptr/2],
      getUShort = (ptr) => memory.heapi16u[ptr/2],
      getByte = (ptr) => memory.heapi8s[ptr],
      getUByte = (ptr) => memory.heapi8u[ptr],
      getFloat = (ptr) => memory.heapf32[ptr/4],
      getDouble = (ptr) => memory.heapf64[ptr/8],
      isDefined = (val) => (val != undefined && val != null),
      encode_handle = (ptr, val) => { setUInt(ptr, spasm.addObject(val)); },
      decode_handle = (ptr) => { return spasm.objects[getUInt(ptr)]; },
      spasm_encode_string = encoder.string,
      spasm_decode_string = decoder.string,
      spasm_indirect_function_get = (ptr)=>spasm.instance.exports.__indirect_function_table.get(ptr),
  spasm_encode_Handle = encode_handle,
  spasm_encode_optional_Handle = (ptr, val)=>{
    if (setBool(ptr+4, isDefined(val))) {
      spasm_encode_Handle(ptr, val);
    }
  },
  spasm_encode_optional_RenderingContext = (ptr, val)=>{
    if (setBool(ptr+8, isDefined(val))) {
      spasm_encode_union4_CanvasRenderingContext2D_ImageBitmapRenderingContext_WebGLRenderingContext_WebGL2RenderingContext(ptr, val);
    }
  },
  spasm_encode_union4_CanvasRenderingContext2D_ImageBitmapRenderingContext_WebGLRenderingContext_WebGL2RenderingContext = (ptr, val)=>{
    if (val instanceof CanvasRenderingContext2D) {
      setUInt(ptr, 0);
      spasm_encode_Handle(ptr+4, val);
    } else if (val instanceof ImageBitmapRenderingContext) {
      setUInt(ptr, 1);
      spasm_encode_Handle(ptr+4, val);
    } else if (val instanceof WebGLRenderingContext) {
      setUInt(ptr, 2);
      spasm_encode_Handle(ptr+4, val);
    } else if (val instanceof WebGL2RenderingContext) {
      setUInt(ptr, 3);
      spasm_encode_Handle(ptr+4, val);
    }
  },
  spasm_decode_ArrayBufferView = (ptr)=>{
    return spasm_decode_union10_Int8Array_Int16Array_Int32Array_Uint8Array_Uint16Array_Uint32Array_Uint8ClampedArray_Float32Array_Float64Array_DataView(ptr);
  },
  spasm_decode_BufferDataSource = (ptr)=>{
    return spasm_decode_union2_ArrayBuffer_ArrayBufferView(ptr);
  },
  spasm_decode_Handle = decode_handle,
  spasm_decode_union10_Int8Array_Int16Array_Int32Array_Uint8Array_Uint16Array_Uint32Array_Uint8ClampedArray_Float32Array_Float64Array_DataView = (ptr)=>{
    if (getUInt(ptr) == 0) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 1) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 2) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 3) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 4) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 5) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 6) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 7) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 8) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 9) {
      return spasm_decode_Handle(ptr+4);
    }
  },
  spasm_decode_union2_ArrayBuffer_ArrayBufferView = (ptr)=>{
    if (getUInt(ptr) == 0) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 1) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 2) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 3) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 4) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 5) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 6) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 7) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 8) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 9) {
      return spasm_decode_Handle(ptr+4);
    } else if (getUInt(ptr) == 10) {
      return spasm_decode_Handle(ptr+4);
    }
  };
export let jsExports = {
  env: {
    MouseEvent_pageX_Get: (ctx) => {
      setupMemory();
      return spasm.objects[ctx].pageX;
    },
    MouseEvent_pageY_Get: (ctx) => {
      setupMemory();
      return spasm.objects[ctx].pageY;
    },
    WheelEvent_deltaY_Get: (ctx) => {
      setupMemory();
      return spasm.objects[ctx].deltaY;
    },
    Element_getBoundingClientRect: (ctx) => {
      setupMemory();
      return spasm.addObject(spasm.objects[ctx].getBoundingClientRect());
    },
    Event_preventDefault: (ctx) => {
      setupMemory();
      spasm.objects[ctx].preventDefault();
    },
    EventTarget_addEventListener_0: (ctx, typeLen, typePtr, callbackCtx, callbackPtr) => {
      setupMemory();
      spasm.objects[ctx].addEventListener(spasm_decode_string(typeLen, typePtr), (event)=>{encode_handle(0, event);spasm_indirect_function_get(callbackPtr)(callbackCtx, 0)});
    },
    AnimationFrameProvider_requestAnimationFrame: (ctx, callbackCtx, callbackPtr) => {
      setupMemory();
      return spasm.objects[ctx].requestAnimationFrame((time)=>{spasm_indirect_function_get(callbackPtr)(callbackCtx, time)});
    },
    HTMLCanvasElement_getContext_0: (rawResult, ctx, contextIdLen, contextIdPtr) => {
      setupMemory();
      spasm_encode_optional_RenderingContext(rawResult, spasm.objects[ctx].getContext(spasm_decode_string(contextIdLen, contextIdPtr)));
    },
    WebGLRenderingContextBase_activeTexture: (ctx, texture) => {
      setupMemory();
      spasm.objects[ctx].activeTexture(texture);
    },
    WebGLRenderingContextBase_attachShader: (ctx, programDefined, program, shaderDefined, shader) => {
      setupMemory();
      spasm.objects[ctx].attachShader(programDefined ? spasm.objects[program] : undefined, shaderDefined ? spasm.objects[shader] : undefined);
    },
    WebGLRenderingContextBase_bindBuffer: (ctx, target, bufferDefined, buffer) => {
      setupMemory();
      spasm.objects[ctx].bindBuffer(target, bufferDefined ? spasm.objects[buffer] : undefined);
    },
    WebGLRenderingContextBase_bindTexture: (ctx, target, textureDefined, texture) => {
      setupMemory();
      spasm.objects[ctx].bindTexture(target, textureDefined ? spasm.objects[texture] : undefined);
    },
    WebGLRenderingContextBase_blendEquation: (ctx, mode) => {
      setupMemory();
      spasm.objects[ctx].blendEquation(mode);
    },
    WebGLRenderingContextBase_blendFunc: (ctx, sfactor, dfactor) => {
      setupMemory();
      spasm.objects[ctx].blendFunc(sfactor, dfactor);
    },
    WebGLRenderingContextBase_bufferData__uint_optional_BufferDataSource_uint: (ctx, target, dataDefined, data, usage) => {
      setupMemory();
      spasm.objects[ctx].bufferData(target, dataDefined ? spasm_decode_BufferDataSource(data) : undefined, usage);
    },
    WebGLRenderingContextBase_clear: (ctx, mask) => {
      setupMemory();
      spasm.objects[ctx].clear(mask);
    },
    WebGLRenderingContextBase_clearColor: (ctx, red, green, blue, alpha) => {
      setupMemory();
      spasm.objects[ctx].clearColor(red, green, blue, alpha);
    },
    WebGLRenderingContextBase_compileShader: (ctx, shaderDefined, shader) => {
      setupMemory();
      spasm.objects[ctx].compileShader(shaderDefined ? spasm.objects[shader] : undefined);
    },
    WebGLRenderingContextBase_createBuffer: (rawResult, ctx) => {
      setupMemory();
      spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].createBuffer());
    },
    WebGLRenderingContextBase_createProgram: (rawResult, ctx) => {
      setupMemory();
      spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].createProgram());
    },
    WebGLRenderingContextBase_createShader: (rawResult, ctx, type) => {
      setupMemory();
      spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].createShader(type));
    },
    WebGLRenderingContextBase_createTexture: (rawResult, ctx) => {
      setupMemory();
      spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].createTexture());
    },
    WebGLRenderingContextBase_disable: (ctx, cap) => {
      setupMemory();
      spasm.objects[ctx].disable(cap);
    },
    WebGLRenderingContextBase_disableVertexAttribArray: (ctx, index) => {
      setupMemory();
      spasm.objects[ctx].disableVertexAttribArray(index);
    },
    WebGLRenderingContextBase_drawElements: (ctx, mode, count, type, offset) => {
      setupMemory();
      spasm.objects[ctx].drawElements(mode, count, type, offset);
    },
    WebGLRenderingContextBase_enable: (ctx, cap) => {
      setupMemory();
      spasm.objects[ctx].enable(cap);
    },
    WebGLRenderingContextBase_enableVertexAttribArray: (ctx, index) => {
      setupMemory();
      spasm.objects[ctx].enableVertexAttribArray(index);
    },
    WebGLRenderingContextBase_getAttribLocation: (ctx, programDefined, program, nameLen, namePtr) => {
      setupMemory();
      return spasm.objects[ctx].getAttribLocation(programDefined ? spasm.objects[program] : undefined, spasm_decode_string(nameLen, namePtr));
    },
    WebGLRenderingContextBase_getParameter: (ctx, pname) => {
      setupMemory();
      return spasm.addObject(spasm.objects[ctx].getParameter(pname));
    },
    WebGLRenderingContextBase_getUniformLocation: (rawResult, ctx, programDefined, program, nameLen, namePtr) => {
      setupMemory();
      spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].getUniformLocation(programDefined ? spasm.objects[program] : undefined, spasm_decode_string(nameLen, namePtr)));
    },
    WebGLRenderingContextBase_linkProgram: (ctx, programDefined, program) => {
      setupMemory();
      spasm.objects[ctx].linkProgram(programDefined ? spasm.objects[program] : undefined);
    },
    WebGLRenderingContextBase_scissor: (ctx, x, y, width, height) => {
      setupMemory();
      spasm.objects[ctx].scissor(x, y, width, height);
    },
    WebGLRenderingContextBase_shaderSource: (ctx, shaderDefined, shader, sourceLen, sourcePtr) => {
      setupMemory();
      spasm.objects[ctx].shaderSource(shaderDefined ? spasm.objects[shader] : undefined, spasm_decode_string(sourceLen, sourcePtr));
    },
    WebGLRenderingContextBase_texImage2D__uint_int_uint_int_int_int_uint_uint_optional_ArrayBufferView: (ctx, target, level, internalformat, width, height, border, format, type, pixelsDefined, pixels) => {
      setupMemory();
      spasm.objects[ctx].texImage2D(target, level, internalformat, width, height, border, format, type, pixelsDefined ? spasm_decode_ArrayBufferView(pixels) : undefined);
    },
    WebGLRenderingContextBase_texParameteri: (ctx, target, pname, param) => {
      setupMemory();
      spasm.objects[ctx].texParameteri(target, pname, param);
    },
    WebGLRenderingContextBase_uniform1i: (ctx, locationDefined, location, x) => {
      setupMemory();
      spasm.objects[ctx].uniform1i(locationDefined ? spasm.objects[location] : undefined, x);
    },
    WebGLRenderingContextBase_uniformMatrix4fv__optional_Handle_bool_Handle: (ctx, locationDefined, location, transpose, value) => {
      setupMemory();
      spasm.objects[ctx].uniformMatrix4fv(locationDefined ? spasm.objects[location] : undefined, transpose, spasm.objects[value]);
    },
    WebGLRenderingContextBase_useProgram: (ctx, programDefined, program) => {
      setupMemory();
      spasm.objects[ctx].useProgram(programDefined ? spasm.objects[program] : undefined);
    },
    WebGLRenderingContextBase_vertexAttribPointer: (ctx, indx, size, type, normalized, stride, offset) => {
      setupMemory();
      spasm.objects[ctx].vertexAttribPointer(indx, size, type, normalized, stride, offset);
    },
    WebGLRenderingContextBase_viewport: (ctx, x, y, width, height) => {
      setupMemory();
      spasm.objects[ctx].viewport(x, y, width, height);
    },
    DOMRect_width_Get: (ctx) => {
      setupMemory();
      return spasm.objects[ctx].width;
    },
    DOMRect_height_Get: (ctx) => {
      setupMemory();
      return spasm.objects[ctx].height;
    },
  }
}
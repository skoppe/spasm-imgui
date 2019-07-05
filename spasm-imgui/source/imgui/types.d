/*
 * Copyright (c) 2015 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictImgui', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module imgui.types;

@safe:

import core.vararg;

// opaque pointer
struct ImGuiTextFilter;
struct ImGuiTextBuffer;
struct ImGuiStorage;
struct ImVector_ImDrawCmd {int Size;int Capacity;ImDrawCmd* Data;}
struct ImVector_ImDrawIdx {int Size;int Capacity;ImDrawIdx* Data;}
struct ImVector_ImDrawVert {int Size;int Capacity;ImDrawVert* Data;}
struct ImVector_ImDrawChannel {int Size;int Capacity;ImDrawChannel* Data;}
struct ImVector_ImVec2 {int Size;int Capacity;ImVec2* Data;}
struct ImVector_ImVec4 {int Size;int Capacity;ImVec4* Data;}
struct ImVector_ImTextureID {int Size;int Capacity;ImTextureID* Data;}
struct ImDrawList
{
  ImVector_ImDrawCmd CmdBuffer;
  ImVector_ImDrawIdx IdxBuffer;
  ImVector_ImDrawVert VtxBuffer;
  ImDrawListFlags Flags;
  const(ImDrawListSharedData)* _Data;
  const(char)* _OwnerName;
  uint _VtxCurrentOffset;
  uint _VtxCurrentIdx;
  ImDrawVert* _VtxWritePtr;
  ImDrawIdx* _IdxWritePtr;
  ImVector_ImVec4 _ClipRectStack;
  ImVector_ImTextureID _TextureIdStack;
  ImVector_ImVec2 _Path;
  ImDrawListSplitter _Splitter;
}
struct ImDrawChannel
{
  ImVector_ImDrawCmd _CmdBuffer;
  ImVector_ImDrawIdx _IdxBuffer;
}
struct ImDrawListSplitter
{
  int _Current;
  int _Count;
  ImVector_ImDrawChannel _Channels;
}
enum ImDrawListFlags
  {
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1 << 0,
    ImDrawListFlags_AntiAliasedFill = 1 << 1,
    ImDrawListFlags_AllowVtxOffset = 1 << 2
  }
struct ImDrawListSharedData;
struct ImFont;
struct CustomRect;
struct ImVector_ImFontPtr {int Size;int Capacity;ImFont** Data;}
struct ImVector_CustomRect {int Size;int Capacity;CustomRect* Data;}
struct ImVector_ImFontConfig {int Size;int Capacity;ImFontConfig* Data;}
enum ImFontAtlasFlags
  {
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1 << 0,
    ImFontAtlasFlags_NoMouseCursors = 1 << 1
  }
struct ImFontAtlas
{
  bool Locked;
  ImFontAtlasFlags Flags;
  ImTextureID TexID;
  int TexDesiredWidth;
  int TexGlyphPadding;
  ubyte* TexPixelsAlpha8;
  uint* TexPixelsRGBA32;
  int TexWidth;
  int TexHeight;
  ImVec2 TexUvScale;
  ImVec2 TexUvWhitePixel;
  ImVector_ImFontPtr Fonts;
  ImVector_CustomRect CustomRects;
  ImVector_ImFontConfig ConfigData;
  int[1] CustomRectIds;
}
struct ImGuiContext;

// Typedefs and Enumerations (declared as int for compatibility and to not pollute the top of this file)
alias uint ImU32;                 // 32-bit unsigned integer (typically used to store packed colors)
alias uint ImGuiID;               // unique ID used by widgets (typically hashed from a stack of string)
alias ushort ImWchar;             // character for keyboard input/display
alias void* ImTextureID;          // user data to identify a texture (this is whatever to you want it to be! read the FAQ about ImTextureID in imgui.cpp)
alias int ImGuiCol;               // a color identifier for styling       // enum ImGuiCol_
alias int ImGuiStyleVar;          // a variable identifier for styling    // enum ImGuiStyleVar_
alias int ImGuiKey;               // a key identifier (ImGui-side enum)   // enum ImGuiKey_
alias int ImGuiColorEditFlags;    // color edit flags for Color*()        // enum ImGuiColorEditFlags_
alias int ImGuiMouseCursor;       // a mouse cursor identifier            // enum ImGuiMouseCursor_
alias int ImGuiWindowFlags;       // window flags for Begin()             // enum ImGuiWindowFlags_
alias int ImGuiFocusedFlags;      // focus flags for IsWindowFocused()    // enum ImGuiFocusedFlags_
alias int ImGuiHoveredFlags;      // flags: for IsItemHovered() etc.      // enum ImGuiHoveredFlags_
alias int ImGuiCond;              // condition flags for Set*()           // enum ImGuiCond_
alias int ImGuiColumnsFlags;      // flags for *Columns*()                // enum ImGuiColumnsFlags_
alias int ImGuiInputTextFlags;    // flags for InputText*()               // enum ImGuiInputTextFlags_
alias int ImGuiSelectableFlags;   // flags for Selectable()               // enum ImGuiSelectableFlags_
alias int ImGuiTreeNodeFlags;     // flags for TreeNode*(), Collapsing*() // enum ImGuiTreeNodeFlags_

extern(C) nothrow {
    alias ImGuiTextEditCallback = int function(ImGuiTextEditCallbackData *data);
    alias ImGuiSizeConstraintCallback = void function(ImGuiSizeConstraintCallbackData *data);
}

alias ulong ImU64;                // 64-bit unsigned integer

struct ImVec2
{
    float x=0;
    float y=0;
}

struct ImVec4
{
    float x=0;
    float y=0;
    float z=0;
    float w=0;
}

enum
{
    // Default: 0
    ImGuiWindowFlags_NoTitleBar             = 1 << 0,   // Disable title-bar
    ImGuiWindowFlags_NoResize               = 1 << 1,   // Disable user resizing with the lower-right grip
    ImGuiWindowFlags_NoMove                 = 1 << 2,   // Disable user moving the window
    ImGuiWindowFlags_NoScrollbar            = 1 << 3,   // Disable scrollbar (window can still scroll with mouse or programatically)
    ImGuiWindowFlags_NoScrollWithMouse      = 1 << 4,   // Disable user scrolling with mouse wheel
    ImGuiWindowFlags_NoCollapse             = 1 << 5,   // Disable user collapsing window by double-clicking on it
    ImGuiWindowFlags_AlwaysAutoResize       = 1 << 6,   // Resize every window to its content every frame
    ImGuiWindowFlags_ShowBorders            = 1 << 7,   // Show borders around windows and items
    ImGuiWindowFlags_NoSavedSettings        = 1 << 8,   // Never load/save settings in .ini file
    ImGuiWindowFlags_NoInputs               = 1 << 9,   // Disable catching mouse or keyboard inputs
    ImGuiWindowFlags_MenuBar                = 1 << 10,   // Has a menubar
    ImGuiWindowFlags_HorizontalScrollbar    = 1 << 11,  // Enable horizontal scrollbar (off by default). You need to use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    ImGuiWindowFlags_NoFocusOnAppearing     = 1 << 12,  // Disable taking focus when transitioning from hidden to visible state
    ImGuiWindowFlags_NoBringToFrontOnFocus  = 1 << 13,  // Disable bringing window to front when taking focus (e.g. clicking on it or programatically giving it focus)
    ImGuiWindowFlags_AlwaysVerticalScrollbar= 1 << 14,  // Always show vertical scrollbar (even if ContentSize.y < Size.y)
    ImGuiWindowFlags_AlwaysHorizontalScrollbar=1<< 15,  // Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 16,  // Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)
    // [Internal]
    ImGuiWindowFlags_ChildWindow            = 1 << 22,  // Don't use! For internal use by BeginChild()
    ImGuiWindowFlags_ComboBox               = 1 << 23,  // Don't use! For internal use by ComboBox()
    ImGuiWindowFlags_Tooltip                = 1 << 24,  // Don't use! For internal use by BeginTooltip()
    ImGuiWindowFlags_Popup                  = 1 << 25,  // Don't use! For internal use by BeginPopup()
    ImGuiWindowFlags_Modal                  = 1 << 26,  // Don't use! For internal use by BeginPopupModal()
    ImGuiWindowFlags_ChildMenu              = 1 << 27   // Don't use! For internal use by BeginMenu()
}

enum
{
    ImGuiFocusedFlags_ChildWindows                  = 1 << 0,   // IsWindowFocused(): Return true if any children of the window is focused
    ImGuiFocusedFlags_RootWindow                    = 1 << 1,   // IsWindowFocused(): Test from root window (top most parent of the current hierarchy)
    ImGuiFocusedFlags_RootAndChildWindows           = ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows
}

enum
{
    ImGuiHoveredFlags_Default                       = 0,        // Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
    ImGuiHoveredFlags_ChildWindows                  = 1 << 0,   // IsWindowHovered() only: Return true if any children of the window is hovered
    ImGuiHoveredFlags_RootWindow                    = 1 << 1,   // IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)
    ImGuiHoveredFlags_AllowWhenBlockedByPopup       = 1 << 2,   // Return true even if a popup window is normally blocking access to this item/window
    //ImGuiHoveredFlags_AllowWhenBlockedByModal     = 1 << 3,   // Return true even if a modal popup window is normally blocking access to this item/window. FIXME-TODO: Unavailable yet.
    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem  = 1 << 4,   // Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.
    ImGuiHoveredFlags_AllowWhenOverlapped           = 1 << 5,   // Return true even if the position is overlapped by another window
    ImGuiHoveredFlags_RectOnly                      = ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped,
    ImGuiHoveredFlags_RootAndChildWindows           = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows
}

enum
{
    // Default: 0
    ImGuiInputTextFlags_CharsDecimal        = 1 << 0,   // Allow 0123456789.+-*/
    ImGuiInputTextFlags_CharsHexadecimal    = 1 << 1,   // Allow 0123456789ABCDEFabcdef
    ImGuiInputTextFlags_CharsUppercase      = 1 << 2,   // Turn a..z into A..Z
    ImGuiInputTextFlags_CharsNoBlank        = 1 << 3,   // Filter out spaces, tabs
    ImGuiInputTextFlags_AutoSelectAll       = 1 << 4,   // Select entire text when first taking mouse focus
    ImGuiInputTextFlags_EnterReturnsTrue    = 1 << 5,   // Return 'true' when Enter is pressed (as opposed to when the value was modified)
    ImGuiInputTextFlags_CallbackCompletion  = 1 << 6,   // Call user function on pressing TAB (for completion handling)
    ImGuiInputTextFlags_CallbackHistory     = 1 << 7,   // Call user function on pressing Up/Down arrows (for history handling)
    ImGuiInputTextFlags_CallbackAlways      = 1 << 8,   // Call user function every time
    ImGuiInputTextFlags_CallbackCharFilter  = 1 << 9,   // Call user function to filter character. Modify data->EventChar to replace/filter input, or return 1 to discard character.
    ImGuiInputTextFlags_AllowTabInput       = 1 << 10,  // Pressing TAB input a '\t' character into the text field
    ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 11,  // In multi-line mode, allow exiting edition by pressing Enter. Ctrl+Enter to add new line (by default adds new lines with Enter).
    ImGuiInputTextFlags_NoHorizontalScroll  = 1 << 12,  // Disable following the cursor horizontally
    ImGuiInputTextFlags_AlwaysInsertMode    = 1 << 13,  // Insert mode
    ImGuiInputTextFlags_ReadOnly            = 1 << 14,  // Read-only mode
    ImGuiInputTextFlags_Password            = 1 << 15,  // Password mode, display all characters as '*'
    // [Internal]
    ImGuiInputTextFlags_Multiline           = 1 << 20   // For internal use by InputTextMultiline()
}

enum
{
    ImGuiTreeNodeFlags_Selected             = 1 << 0,   // Draw as selected
    ImGuiTreeNodeFlags_Framed               = 1 << 1,   // Full colored frame (e.g. for CollapsingHeader)
    ImGuiTreeNodeFlags_AllowItemOverlap     = 1 << 2,   // Hit testing to allow subsequent widgets to overlap this one
    ImGuiTreeNodeFlags_NoTreePushOnOpen     = 1 << 3,   // Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    ImGuiTreeNodeFlags_NoAutoOpenOnLog      = 1 << 4,   // Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    ImGuiTreeNodeFlags_DefaultOpen          = 1 << 5,   // Default node to be open
    ImGuiTreeNodeFlags_OpenOnDoubleClick    = 1 << 6,   // Need double-click to open node
    ImGuiTreeNodeFlags_OpenOnArrow          = 1 << 7,   // Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    ImGuiTreeNodeFlags_Leaf                 = 1 << 8,   // No collapsing, no arrow (use as a convenience for leaf nodes). 
    ImGuiTreeNodeFlags_Bullet               = 1 << 9,   // Display a bullet instead of arrow
    //ImGuITreeNodeFlags_SpanAllAvailWidth  = 1 << 10,  // FIXME: TODO: Extend hit box horizontally even if not framed
    //ImGuiTreeNodeFlags_NoScrollOnOpen     = 1 << 11,  // FIXME: TODO: Disable automatic scroll on TreePop() if node got just open and contents is not visible
    ImGuiTreeNodeFlags_CollapsingHeader     = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoAutoOpenOnLog
}

enum
{
    // Default: 0
    ImGuiSelectableFlags_DontClosePopups    = 1 << 0,   // Clicking this don't close parent popup window
    ImGuiSelectableFlags_SpanAllColumns     = 1 << 1,    // Selectable frame can span all columns (text will still fit in current column)
    ImGuiSelectableFlags_AllowDoubleClick   = 1 << 2    // Generate press events on double clicks too
}

enum
{
    ImGuiKey_Tab,       // for tabbing through fields
    ImGuiKey_LeftArrow, // for text edit
    ImGuiKey_RightArrow,// for text edit
    ImGuiKey_UpArrow,   // for text edit
    ImGuiKey_DownArrow, // for text edit
    ImGuiKey_PageUp,
    ImGuiKey_PageDown,
    ImGuiKey_Home,      // for text edit
    ImGuiKey_End,       // for text edit
    ImGuiKey_Insert,
    ImGuiKey_Delete,    // for text edit
    ImGuiKey_Backspace, // for text edit
    ImGuiKey_Space,
    ImGuiKey_Enter,     // for text edit
    ImGuiKey_Escape,    // for text edit
    ImGuiKey_A,         // for text edit CTRL+A: select all
    ImGuiKey_C,         // for text edit CTRL+C: copy
    ImGuiKey_V,         // for text edit CTRL+V: paste
    ImGuiKey_X,         // for text edit CTRL+X: cut
    ImGuiKey_Y,         // for text edit CTRL+Y: redo
    ImGuiKey_Z,         // for text edit CTRL+Z: undo
    ImGuiKey_COUNT
};

enum
{
    ImGuiCol_Text,
    ImGuiCol_TextDisabled,
    ImGuiCol_WindowBg,              // Background of normal windows
    ImGuiCol_ChildBg,               // Background of child windows
    ImGuiCol_PopupBg,               // Background of popups, menus, tooltips windows
    ImGuiCol_Border,
    ImGuiCol_BorderShadow,
    ImGuiCol_FrameBg,               // Background of checkbox, radio button, plot, slider, text input
    ImGuiCol_FrameBgHovered,
    ImGuiCol_FrameBgActive,
    ImGuiCol_TitleBg,
    ImGuiCol_TitleBgActive,
    ImGuiCol_TitleBgCollapsed,
    ImGuiCol_MenuBarBg,
    ImGuiCol_ScrollbarBg,
    ImGuiCol_ScrollbarGrab,
    ImGuiCol_ScrollbarGrabHovered,
    ImGuiCol_ScrollbarGrabActive,
    ImGuiCol_CheckMark,
    ImGuiCol_SliderGrab,
    ImGuiCol_SliderGrabActive,
    ImGuiCol_Button,
    ImGuiCol_ButtonHovered,
    ImGuiCol_ButtonActive,
    ImGuiCol_Header,
    ImGuiCol_HeaderHovered,
    ImGuiCol_HeaderActive,
    ImGuiCol_Separator,
    ImGuiCol_SeparatorHovered,
    ImGuiCol_SeparatorActive,
    ImGuiCol_ResizeGrip,
    ImGuiCol_ResizeGripHovered,
    ImGuiCol_ResizeGripActive,
    ImGuiCol_Tab,
    ImGuiCol_TabHovered,
    ImGuiCol_TabActive,
    ImGuiCol_TabUnfocused,
    ImGuiCol_TabUnfocusedActive,
    ImGuiCol_PlotLines,
    ImGuiCol_PlotLinesHovered,
    ImGuiCol_PlotHistogram,
    ImGuiCol_PlotHistogramHovered,
    ImGuiCol_TextSelectedBg,
    ImGuiCol_DragDropTarget,
    ImGuiCol_NavHighlight,          // Gamepad/keyboard: current highlighted item
    ImGuiCol_NavWindowingHighlight, // Highlight window when using CTRL+TAB
    ImGuiCol_NavWindowingDimBg,     // Darken/colorize entire screen behind the CTRL+TAB window list, when active
    ImGuiCol_ModalWindowDimBg,      // Darken/colorize entire screen behind a modal window, when one is active
    ImGuiCol_COUNT
}
enum
{
    ImGuiStyleVar_Alpha,               // float     Alpha
    ImGuiStyleVar_WindowPadding,       // ImVec2    WindowPadding
    ImGuiStyleVar_WindowRounding,      // float     WindowRounding
    ImGuiStyleVar_WindowBorderSize,    // float     WindowBorderSize
    ImGuiStyleVar_WindowMinSize,       // ImVec2    WindowMinSize
    ImGuiStyleVar_WindowTitleAlign,    // ImVec2    WindowTitleAlign
    ImGuiStyleVar_ChildRounding,       // float     ChildRounding
    ImGuiStyleVar_ChildBorderSize,     // float     ChildBorderSize
    ImGuiStyleVar_PopupRounding,       // float     PopupRounding
    ImGuiStyleVar_PopupBorderSize,     // float     PopupBorderSize
    ImGuiStyleVar_FramePadding,        // ImVec2    FramePadding
    ImGuiStyleVar_FrameRounding,       // float     FrameRounding
    ImGuiStyleVar_FrameBorderSize,     // float     FrameBorderSize
    ImGuiStyleVar_ItemSpacing,         // ImVec2    ItemSpacing
    ImGuiStyleVar_ItemInnerSpacing,    // ImVec2    ItemInnerSpacing
    ImGuiStyleVar_IndentSpacing,       // float     IndentSpacing
    ImGuiStyleVar_ScrollbarSize,       // float     ScrollbarSize
    ImGuiStyleVar_ScrollbarRounding,   // float     ScrollbarRounding
    ImGuiStyleVar_GrabMinSize,         // float     GrabMinSize
    ImGuiStyleVar_GrabRounding,        // float     GrabRounding
    ImGuiStyleVar_TabRounding,         // float     TabRounding
    ImGuiStyleVar_ButtonTextAlign,     // ImVec2    ButtonTextAlign
    ImGuiStyleVar_SelectableTextAlign, // ImVec2    SelectableTextAlign
    ImGuiStyleVar_COUNT
}

enum
{
    ImGuiColorEditFlags_None            = 0,
    ImGuiColorEditFlags_NoAlpha         = 1 << 1,   //              // ColorEdit, ColorPicker, ColorButton: ignore Alpha component (will only read 3 components from the input pointer).
    ImGuiColorEditFlags_NoPicker        = 1 << 2,   //              // ColorEdit: disable picker when clicking on colored square.
    ImGuiColorEditFlags_NoOptions       = 1 << 3,   //              // ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    ImGuiColorEditFlags_NoSmallPreview  = 1 << 4,   //              // ColorEdit, ColorPicker: disable colored square preview next to the inputs. (e.g. to show only the inputs)
    ImGuiColorEditFlags_NoInputs        = 1 << 5,   //              // ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview colored square).
    ImGuiColorEditFlags_NoTooltip       = 1 << 6,   //              // ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    ImGuiColorEditFlags_NoLabel         = 1 << 7,   //              // ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    ImGuiColorEditFlags_NoSidePreview   = 1 << 8,   //              // ColorPicker: disable bigger color preview on right side of the picker, use small colored square preview instead.
    ImGuiColorEditFlags_NoDragDrop      = 1 << 9,   //              // ColorEdit: disable drag and drop target. ColorButton: disable drag and drop source.

    // User Options (right-click on widget to change some of them).
    ImGuiColorEditFlags_AlphaBar        = 1 << 16,  //              // ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    ImGuiColorEditFlags_AlphaPreview    = 1 << 17,  //              // ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    ImGuiColorEditFlags_AlphaPreviewHalf= 1 << 18,  //              // ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    ImGuiColorEditFlags_HDR             = 1 << 19,  //              // (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).
    ImGuiColorEditFlags_DisplayRGB      = 1 << 20,  // [Display]    // ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    ImGuiColorEditFlags_DisplayHSV      = 1 << 21,  // [Display]    // "
    ImGuiColorEditFlags_DisplayHex      = 1 << 22,  // [Display]    // "
    ImGuiColorEditFlags_Uint8           = 1 << 23,  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
    ImGuiColorEditFlags_Float           = 1 << 24,  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    ImGuiColorEditFlags_PickerHueBar    = 1 << 25,  // [Picker]     // ColorPicker: bar for Hue, rectangle for Sat/Value.
    ImGuiColorEditFlags_PickerHueWheel  = 1 << 26,  // [Picker]     // ColorPicker: wheel for Hue, triangle for Sat/Value.
    ImGuiColorEditFlags_InputRGB        = 1 << 27,  // [Input]      // ColorEdit, ColorPicker: input and output data in RGB format.
    ImGuiColorEditFlags_InputHSV        = 1 << 28,  // [Input]      // ColorEdit, ColorPicker: input and output data in HSV format.

    // Defaults Options. You can set application defaults using SetColorEditOptions(). The intent is that you probably don't want to
    // override them in most of your calls. Let the user choose via the option menu and/or call SetColorEditOptions() once during startup.
    ImGuiColorEditFlags__OptionsDefault = ImGuiColorEditFlags_Uint8|ImGuiColorEditFlags_DisplayRGB|ImGuiColorEditFlags_InputRGB|ImGuiColorEditFlags_PickerHueBar,

    // [Internal] Masks
    ImGuiColorEditFlags__DisplayMask    = ImGuiColorEditFlags_DisplayRGB|ImGuiColorEditFlags_DisplayHSV|ImGuiColorEditFlags_DisplayHex,
    ImGuiColorEditFlags__DataTypeMask   = ImGuiColorEditFlags_Uint8|ImGuiColorEditFlags_Float,
    ImGuiColorEditFlags__PickerMask     = ImGuiColorEditFlags_PickerHueWheel|ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags__InputMask      = ImGuiColorEditFlags_InputRGB|ImGuiColorEditFlags_InputHSV
}

enum
{
  ImGuiMouseCursor_None = -1,
  ImGuiMouseCursor_Arrow = 0,
  ImGuiMouseCursor_TextInput,         // When hovering over InputText, etc.
  ImGuiMouseCursor_ResizeAll,         // (Unused by Dear ImGui functions)
  ImGuiMouseCursor_ResizeNS,          // When hovering over an horizontal border
  ImGuiMouseCursor_ResizeEW,          // When hovering over a vertical border or a column
  ImGuiMouseCursor_ResizeNESW,        // When hovering over the bottom-left corner of a window
  ImGuiMouseCursor_ResizeNWSE,        // When hovering over the bottom-right corner of a window
  ImGuiMouseCursor_Hand,              // (Unused by Dear ImGui functions. Use for e.g. hyperlinks)
  ImGuiMouseCursor_COUNT
}

enum
{
    ImGuiCond_Always        = 1 << 0, // Set the variable
    ImGuiCond_Once          = 1 << 1, // Set the variable once per runtime session (only the first call with succeed)
    ImGuiCond_FirstUseEver  = 1 << 2, // Set the variable if the window has no saved data (if doesn't exist in the .ini file)
    ImGuiCond_Appearing     = 1 << 3  // Set the variable if the window is appearing after being hidden/inactive (or the first time)
}

struct ImGuiStyle
{
    float       Alpha = 1.0f;                         // Global alpha applies to everything in ImGui
    ImVec2      WindowPadding = ImVec2(8,8);          // Padding within a window
    float       WindowRounding = 7.0f;                // Radius of window corners rounding. Set to 0.0f to have rectangular windows
    float       WindowBorderSize = 0.0f;              // Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly)
    ImVec2      WindowMinSize = ImVec2(32,32);        // Minimum window size
    ImVec2      WindowTitleAlign = ImVec2(0.0f,0.5f); // Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
    float       ChildRounding = 0.0f;                 // Radius of child window corners rounding. Set to 0.0f to have rectangular windows
    float       ChildBorderSize = 1.0f;               // Thickness of border around child windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    float       PopupRounding = 0.0f;                 // Radius of popup window corners rounding. Set to 0.0f to have rectangular child windows
    float       PopupBorderSize = 1.0f;               // Thickness of border around popup or tooltip windows. Generally set to 0.0f or 1.0f. Other values not well tested.
    ImVec2      FramePadding = ImVec2(4,3);           // Padding within a framed rectangle (used by most widgets)
    float       FrameRounding = 0.0f;                 // Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
    float       FrameBorderSize = 0.0f;               // Thickness of border around frames. Generally set to 0.0f or 1.0f. Other values not well tested.
    ImVec2      ItemSpacing = ImVec2(8,4);            // Horizontal and vertical spacing between widgets/lines
    ImVec2      ItemInnerSpacing = ImVec2(4,4);       // Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label)
    ImVec2      TouchExtraPadding = ImVec2(0,0);      // Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
    float       IndentSpacing = 21.0f;                // Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
    float       ColumnsMinSpacing = 6.0f;             // Minimum horizontal spacing between two columns
    float       ScrollbarSize = 16.0f;                // Width of the vertical scrollbar, Height of the horizontal scrollbar
    float       ScrollbarRounding = 9.0f;             // Radius of grab corners for scrollbar
    float       GrabMinSize = 10.0f;                  // Minimum width/height of a grab box for slider/scrollbar.
    float       GrabRounding = 0.0f;                  // Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
    ImVec2      ButtonTextAlign = ImVec2(0.5f,0.5f);  // Alignment of button text when button is larger than text. Defaults to (0.5f,0.5f) for horizontally+vertically centered.
    ImVec2      DisplayWindowPadding = ImVec2(22,22); // Window positions are clamped to be visible within the display area by at least this amount. Only covers regular windows.
    ImVec2      DisplaySafeAreaPadding = ImVec2(4,4); // If you cannot see the edge of your screen (e.g. on a TV) increase the safe area padding. Covers popups/tooltips as well regular windows.
    bool        AntiAliasedLines = true;              // Enable anti-aliasing on lines/borders. Disable if you are really tight on CPU/GPU.
    bool        AntiAliasedFill = true;             // Enable anti-aliasing on filled shapes (rounded rectangles, circles, etc.)
    float       CurveTessellationTol = 1.25f;         // Tessellation tolerance. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
    ImVec4[ImGuiCol_COUNT] Colors = [
        ImVec4(0.90f, 0.90f, 0.90f, 1.00f),
        ImVec4(0.60f, 0.60f, 0.60f, 1.00f),
        ImVec4(0.00f, 0.00f, 0.00f, 0.70f),
        ImVec4(0.00f, 0.00f, 0.00f, 0.00f),
        ImVec4(0.05f, 0.05f, 0.10f, 0.90f),
        ImVec4(0.70f, 0.70f, 0.70f, 0.40f),
        ImVec4(0.00f, 0.00f, 0.00f, 0.00f),
        ImVec4(0.80f, 0.80f, 0.80f, 0.30f),   // Background of checkbox, radio button, plot, slider, text input
        ImVec4(0.90f, 0.80f, 0.80f, 0.40f),
        ImVec4(0.90f, 0.65f, 0.65f, 0.45f),
        ImVec4(0.27f, 0.27f, 0.54f, 0.83f),
        ImVec4(0.40f, 0.40f, 0.80f, 0.20f),
        ImVec4(0.32f, 0.32f, 0.63f, 0.87f),
        ImVec4(0.40f, 0.40f, 0.55f, 0.80f),
        ImVec4(0.20f, 0.25f, 0.30f, 0.60f),
        ImVec4(0.40f, 0.40f, 0.80f, 0.30f),
        ImVec4(0.40f, 0.40f, 0.80f, 0.40f),
        ImVec4(0.80f, 0.50f, 0.50f, 0.40f),
        ImVec4(0.20f, 0.20f, 0.20f, 0.99f),
        ImVec4(0.90f, 0.90f, 0.90f, 0.50f),
        ImVec4(1.00f, 1.00f, 1.00f, 0.30f),
        ImVec4(0.80f, 0.50f, 0.50f, 1.00f),
        ImVec4(0.67f, 0.40f, 0.40f, 0.60f),
        ImVec4(0.67f, 0.40f, 0.40f, 1.00f),
        ImVec4(0.80f, 0.50f, 0.50f, 1.00f),
        ImVec4(0.40f, 0.40f, 0.90f, 0.45f),
        ImVec4(0.45f, 0.45f, 0.90f, 0.80f),
        ImVec4(0.53f, 0.53f, 0.87f, 0.80f),
        ImVec4(0.50f, 0.50f, 0.50f, 1.00f),
        ImVec4(0.60f, 0.60f, 0.70f, 1.00f),
        ImVec4(0.70f, 0.70f, 0.90f, 1.00f),
        ImVec4(1.00f, 1.00f, 1.00f, 0.30f),
        ImVec4(1.00f, 1.00f, 1.00f, 0.60f),
        ImVec4(1.00f, 1.00f, 1.00f, 0.90f),
        ImVec4(0.50f, 0.50f, 0.90f, 0.50f),
        ImVec4(0.70f, 0.70f, 0.90f, 0.60f),
        ImVec4(0.70f, 0.70f, 0.70f, 1.00f),
        ImVec4(1.00f, 1.00f, 1.00f, 1.00f),
        ImVec4(0.90f, 0.70f, 0.00f, 1.00f),
        ImVec4(0.90f, 0.70f, 0.00f, 1.00f),
        ImVec4(1.00f, 0.60f, 0.00f, 1.00f),
        ImVec4(0.00f, 0.00f, 1.00f, 0.35f),
        ImVec4(0.20f, 0.20f, 0.20f, 0.35f),
    ];
}

extern(C) nothrow {
    alias RenderDrawListFunc = void function(ImDrawData* data);
    alias GetClipboardTextFunc = const(char)* function(void* user_data);
    alias SetClipboardTextFunc = void function(void* user_data, const(char)* text);
    alias MemAllocFunc = void* function(size_t);
    alias MemFreeFunc = void function(void*);
    alias ImeSetInputScreenPosFunc = void function(int,int);
}

enum ImGuiConfigFlags
  {
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1 << 0,
    ImGuiConfigFlags_NavEnableGamepad = 1 << 1,
    ImGuiConfigFlags_NavEnableSetMousePos = 1 << 2,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 1 << 3,
    ImGuiConfigFlags_NoMouse = 1 << 4,
    ImGuiConfigFlags_NoMouseCursorChange = 1 << 5,
    ImGuiConfigFlags_IsSRGB = 1 << 20,
    ImGuiConfigFlags_IsTouchScreen = 1 << 21
  };
enum ImGuiBackendFlags
  {
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1 << 0,
    ImGuiBackendFlags_HasMouseCursors = 1 << 1,
    ImGuiBackendFlags_HasSetMousePos = 1 << 2,
    ImGuiBackendFlags_RendererHasVtxOffset = 1 << 3
  };
enum ImGuiNavInput
  {
    ImGuiNavInput_Activate,
    ImGuiNavInput_Cancel,
    ImGuiNavInput_Input,
    ImGuiNavInput_Menu,
    ImGuiNavInput_DpadLeft,
    ImGuiNavInput_DpadRight,
    ImGuiNavInput_DpadUp,
    ImGuiNavInput_DpadDown,
    ImGuiNavInput_LStickLeft,
    ImGuiNavInput_LStickRight,
    ImGuiNavInput_LStickUp,
    ImGuiNavInput_LStickDown,
    ImGuiNavInput_FocusPrev,
    ImGuiNavInput_FocusNext,
    ImGuiNavInput_TweakSlow,
    ImGuiNavInput_TweakFast,
    ImGuiNavInput_KeyMenu_,
    ImGuiNavInput_KeyTab_,
    ImGuiNavInput_KeyLeft_,
    ImGuiNavInput_KeyRight_,
    ImGuiNavInput_KeyUp_,
    ImGuiNavInput_KeyDown_,
    ImGuiNavInput_COUNT,
    ImGuiNavInput_InternalStart_ = ImGuiNavInput_KeyMenu_
  };
struct ImVector_ImWchar {int Size;int Capacity;ImWchar* Data;}
struct ImGuiIO
{
    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime;
    float IniSavingRate;
  const (char)* IniFilename;
  const (char)* LogFilename;
    float MouseDoubleClickTime;
    float MouseDoubleClickMaxDist;
    float MouseDragThreshold;
  int[ImGuiKey_COUNT] KeyMap;
    float KeyRepeatDelay;
    float KeyRepeatRate;
    void* UserData;
    ImFontAtlas*Fonts;
    float FontGlobalScale;
    bool FontAllowUserScaling;
    ImFont* FontDefault;
    ImVec2 DisplayFramebufferScale;
    bool MouseDrawCursor;
    bool ConfigMacOSXBehaviors;
    bool ConfigInputTextCursorBlink;
    bool ConfigWindowsResizeFromEdges;
    bool ConfigWindowsMoveFromTitleBarOnly;
    const char* BackendPlatformName;
    const char* BackendRendererName;
    void* BackendPlatformUserData;
    void* BackendRendererUserData;
    void* BackendLanguageUserData;
  const (char)* function(void* user_data) GetClipboardTextFn;
  void function(void* user_data, const char* text) SetClipboardTextFn;
    void* ClipboardUserData;
  void function(int x, int y) ImeSetInputScreenPosFn;
    void* ImeWindowHandle;
    void* RenderDrawListsFnUnused;
    ImVec2 MousePos;
    bool[5] MouseDown;
    float MouseWheel;
    float MouseWheelH;
    bool KeyCtrl;
    bool KeyShift;
    bool KeyAlt;
    bool KeySuper;
    bool[512] KeysDown;
  float[ImGuiNavInput.ImGuiNavInput_COUNT] NavInputs;
    bool WantCaptureMouse;
    bool WantCaptureKeyboard;
    bool WantTextInput;
    bool WantSetMousePos;
    bool WantSaveIniSettings;
    bool NavActive;
    bool NavVisible;
    float Framerate;
    int MetricsRenderVertices;
    int MetricsRenderIndices;
    int MetricsRenderWindows;
    int MetricsActiveWindows;
    int MetricsActiveAllocations;
    ImVec2 MouseDelta;
    ImVec2 MousePosPrev;
    ImVec2[5] MouseClickedPos;
    double[5] MouseClickedTime;
    bool[5] MouseClicked;
    bool[5] MouseDoubleClicked;
    bool[5] MouseReleased;
    bool[5] MouseDownOwned;
    bool[5] MouseDownWasDoubleClick;
    float[5] MouseDownDuration;
    float[5] MouseDownDurationPrev;
    ImVec2[5] MouseDragMaxDistanceAbs;
    float[5] MouseDragMaxDistanceSqr;
    float[512] KeysDownDuration;
    float[512] KeysDownDurationPrev;
  float[ImGuiNavInput.ImGuiNavInput_COUNT] NavInputsDownDuration;
  float[ImGuiNavInput.ImGuiNavInput_COUNT] NavInputsDownDurationPrev;
    ImVector_ImWchar InputQueueCharacters;
}
//struct ImVector(T);
//struct ImGuiOnceUponAFrame;

// Helper: Parse and apply text filters. In format "aaaaa[,bbbb][,ccccc]"
struct ImGuiTextFilterWrapper
{
extern(C) @nogc nothrow:
    import imgui.funcs;
    private ImGuiTextFilter* filter = null;

    this(const(char)* default_filter) { filter = ImGuiTextFilter_Create(default_filter); }
    this(this) { filter = ImGuiTextFilter_Create(ImGuiTextFilter_GetInputBuf(filter)); }
    ~this() { if(filter) ImGuiTextFilter_Destroy(filter); }
    void init() { if(!filter) filter = ImGuiTextFilter_Create(""); }
    void Clear() { if(filter) ImGuiTextFilter_Clear(filter); else init(); }

    bool Draw(const(char)* label = "Filter (inc,-exc)", float width = 0.0f)
    { init(); return ImGuiTextFilter_Draw(filter, label, width); }

    bool PassFilter(const(char)* text, const(char)* text_end = null) const
    { if(!filter) return true; return ImGuiTextFilter_PassFilter(filter, text, text_end); }

    bool IsActive() const
    { if(!filter) return false; return ImGuiTextFilter_IsActive(filter); }

    void Build()
    { init(); ImGuiTextFilter_Build(filter); }
}

// Helper: Text buffer for logging/accumulating text
struct ImGuiTextBufferWrapper
{
extern(C):
    import imgui.funcs;
    import core.stdc.stdarg: va_list, va_start, va_end;
    private ImGuiTextBuffer* buffer = null;

    nothrow {
        this(this) {
            auto s = ImGuiTextBuffer_c_str(buffer);
            buffer = ImGuiTextBuffer_Create();
            ImGuiTextBuffer_appendf(buffer, "%s", s);
        }
        ~this() { if(buffer) ImGuiTextBuffer_Destroy(buffer); }
        void init() { if(!buffer) buffer = ImGuiTextBuffer_Create(); }
        char opIndex(int i) { if(!buffer) return 0; return ImGuiTextBuffer_index(buffer, i); }
        const(char)* begin() const { if(!buffer) return ""; return ImGuiTextBuffer_begin(buffer); }
        const(char)* end() const { if(!buffer) return begin(); return ImGuiTextBuffer_end(buffer); }
        int size() const { if(!buffer) return 0; return ImGuiTextBuffer_size(buffer); }
        bool empty() { if(!buffer) return true; return ImGuiTextBuffer_empty(buffer); }
        void clear() { init(); return ImGuiTextBuffer_clear(buffer); }
        void appendfv(const(char)* fmt, va_list args) {
            init();
            return ImGuiTextBuffer_appendfv(buffer, fmt, args);
        }
    }

    void appendf(const(char)* fmt, ...) @trusted {
        va_list args;
        va_start(args, fmt);
        appendfv(fmt, args);
        va_end(args);
    }
}

//struct ImGuiStorage;

// Shared state of InputText(), passed to callback when a ImGuiInputTextFlags_Callback* flag is used.
struct ImGuiTextEditCallbackData
{
extern(C) @nogc nothrow:
    import imgui.funcs;
    ImGuiInputTextFlags EventFlag;      // One of ImGuiInputTextFlags_Callback* // Read-only
    ImGuiInputTextFlags Flags;          // What user passed to InputText()      // Read-only
    void*               UserData;       // What user passed to InputText()      // Read-only
    bool                ReadOnly;       // Read-only mode                       // Read-only

    // CharFilter event:
    ImWchar             EventChar;      // Character input                      // Read-write (replace character or set to zero)

    // Completion,History,Always events:
    ImGuiKey            EventKey;       // Key pressed (Up/Down/TAB)            // Read-only
    char*               Buf;            // Current text                         // Read-write (pointed data only)
    int                 BufTextLen;     // Current text length in bytes         // Read-write
    size_t              BufSize;        //                                      // Read-only
    bool                BufDirty;       // Set if you modify Buf directly       // Write
    int                 CursorPos;      //                                      // Read-write
    int                 SelectionStart; //                                      // Read-write (== to SelectionEnd when no selection)
    int                 SelectionEnd;   //                                      // Read-write

    // NB: calling those function loses selection.
    void DeleteChars(int pos, int bytes_count) { ImGuiTextEditCallbackData_DeleteChars(&this, pos, bytes_count); }
    void InsertChars(int pos, const(char)* text, const(char)* text_end = null) { ImGuiTextEditCallbackData_InsertChars(&this, pos, text, text_end); }
    bool HasSelection() const { return SelectionStart != SelectionEnd; }
}

struct ImGuiSizeConstraintCallbackData
{
    void*   UserData;       // Read-only.   What user passed to SetNextWindowSizeConstraints()
    ImVec2  Pos;            // Read-only.   Window position, for reference.
    ImVec2  CurrentSize;    // Read-only.   Current window size.
    ImVec2  DesiredSize;    // Read-write.  Desired size, based on user's mouse position. Write to this field to restrain resizing.
}

// Helpers macros to generate 32-bits encoded colors
version(IMGUI_USE_BGRA_PACKED_COLOR) {
    enum IM_COL32_R_SHIFT    = 16;
    enum IM_COL32_G_SHIFT    = 8;
    enum IM_COL32_B_SHIFT    = 0;
    enum IM_COL32_A_SHIFT    = 24;
    enum IM_COL32_A_MASK     = 0xFF000000;
} else {
    enum IM_COL32_R_SHIFT    = 0;
    enum IM_COL32_G_SHIFT    = 8;
    enum IM_COL32_B_SHIFT    = 16;
    enum IM_COL32_A_SHIFT    = 24;
    enum IM_COL32_A_MASK     = 0xFF000000;
}
uint IM_COL32(ubyte R, ubyte G, ubyte B, ubyte A) {
    return (
            (cast(ImU32)(A)<<IM_COL32_A_SHIFT) | 
            (cast(ImU32)(B)<<IM_COL32_B_SHIFT) | 
            (cast(ImU32)(G)<<IM_COL32_G_SHIFT) | 
            (cast(ImU32)(R)<<IM_COL32_R_SHIFT)
            );
}
@property uint IM_COL32_WHITE() {
    return IM_COL32(255,255,255,255);   // Opaque white = 0xFFFFFFFF
}
@property uint IM_COL32_BLACK() {
    return IM_COL32(0,0,0,255);         // Opaque black
}
@property uint IM_COL32_BLACK_TRANS() {
    return IM_COL32(0,0,0,0);           // Transparent black = 0x00000000
}

struct ImColor
{
extern(C) @nogc nothrow:
    import imgui.funcs;
    ImVec4 Value = ImVec4(0, 0, 0, 0);
    alias Value this;

    this(ubyte r, ubyte g, ubyte b, ubyte a = 255)
    {
        float sc = 1.0f/255.0f;
        Value.x = r * sc;
        Value.y = g * sc;
        Value.z = b * sc;
        Value.w = a * sc;
    }

    this(ImU32 rgba)
    {
        this(cast(ubyte)(rgba>>IM_COL32_R_SHIFT), cast(ubyte)(rgba>>IM_COL32_G_SHIFT),
             cast(ubyte)(rgba>>IM_COL32_B_SHIFT), cast(ubyte)(rgba>>IM_COL32_A_SHIFT));
    }

    this(float r, float g, float b, float a = 1.0f)
    {
        Value.x = r; 
        Value.y = g; 
        Value.z = b; 
        Value.w = a; 
    }

    this(const ImVec4 col) { Value = col; }

    ImU32 asImU32() @property
    {
        return igColorConvertFloat4ToU32(Value);
    }

    ImVec4 asImVec4() @property { return Value; }

    void SetHSV(float h, float s, float v, float a = 1.0f)
    {
        this = HSV(h, s, v, a);
    }

    static ImColor HSV(float h, float s, float v, float a = 1.0f)
    {
        import imgui.funcs;
        float r,g,b;
        igColorConvertHSVtoRGB(h, s, v, &r, &g, &b);
        return ImColor(r,g,b,a);
    }
}

struct ImGuiListClipper {
extern(C) @nogc nothrow:
    import imgui.funcs : ImGuiListClipper_Begin, ImGuiListClipper_End, ImGuiListClipper_Step;

    float StartPosY = 0;
    float ItemsHeight = -1;
    int ItemsCount = -1, StepNo = 0, DisplayStart = -1, DisplayEnd = -1;

    this(int items_count, float items_height = -1.0f)
    {
        ImGuiListClipper_Begin(&this, items_count, items_height);
    }

    ~this()
    {
        assert(ItemsCount == -1);
    }

    bool Step() { return ImGuiListClipper_Step(&this); }

    void Begin(int items_count, float items_height = -1.0f)
    {
        ImGuiListClipper_Begin(&this, items_count, items_height);
    }

    void End() { ImGuiListClipper_End(&this); }
}

extern(C) nothrow {
    alias ImDrawCallback = void function(const ImDrawList* parent_list, const ImDrawCmd* cmd);
}

struct ImDrawCmd
{
  uint ElemCount;
  ImVec4 ClipRect;
  ImTextureID TextureId;
  uint VtxOffset;
  uint IdxOffset;
  ImDrawCallback UserCallback;
  void* UserCallbackData;
}

alias ImDrawIdx = ushort;

struct ImDrawVert
{
    ImVec2  pos;
    ImVec2  uv;
    ImU32   col;
}

//struct ImDrawChannel;
//struct ImDrawList;

struct ImDrawData
{
extern(C) @nogc nothrow:
    import imgui.funcs;
    bool            Valid = false;              // Only valid after Render() is called and before the next NewFrame() is called.
    ImDrawList**    CmdLists = null;
    int             CmdListsCount = 0;
    int             TotalVtxCount = 0;          // For convenience, sum of all cmd_lists vtx_buffer.Size
    int             TotalIdxCount = 0;          // For convenience, sum of all cmd_lists idx_buffer.Size

    // Functions
    void DeIndexAllBuffers()                    // For backward compatibility or convenience: convert all buffers from indexed to de-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!
    {
        ImDrawData_DeIndexAllBuffers(&this);
    }

    void ScaleClipRects(const ImVec2 sc)        // Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.
    {
        ImDrawData_ScaleClipRects(&this, sc);
    }
}

struct ImFontConfig
{
    void*           FontData = null;                         // TTF/OTF data
    int             FontDataSize = 0;                        // TTF/OTF data size
    bool            FontDataOwnedByAtlas = true;             // TTF/OTF data ownership taken by the container ImFontAtlas (will delete memory itself). Set to true
    int             FontNo = 0;                              // Index of font within TTF/OTF file
    float           SizePixels = 0.0f;                       // Size in pixels for rasterizer
    int             OversampleH = 3, OversampleV = 1;        // Rasterize at higher quality for sub-pixel positioning. We don't use sub-pixel positions on the Y axis.
    bool            PixelSnapH = false;                      // Align every glyph to pixel boundary. Useful e.g. if you are merging a non-pixel aligned font with the default font. If enabled, you can set OversampleH/V to 1.
    ImVec2          GlyphExtraSpacing = ImVec2(0.0f, 0.0f);  // Extra spacing (in pixels) between glyphs. Only X axis is supported for now.
    ImVec2          GlyphOffset = ImVec2(0.0f, 0.0f);        // Offset all glyphs from this font input
    const ImWchar*  GlyphRanges = null;                      // Pointer to a user-provided list of Unicode range (2 value per range, values are inclusive, zero-terminated list). THE ARRAY DATA NEEDS TO PERSIST AS LONG AS THE FONT IS ALIVE.
    bool            MergeMode = false;                       // Merge into previous ImFont, so you can combine multiple inputs font into one ImFont (e.g. ASCII font + icons + Japanese glyphs). You may want to use GlyphOffset.y when merge font of different heights.

    // [Internal]
    char[32]        Name = 0;                                // Name (strictly to ease debugging)
    ImFont*         DstFont = null;
}

//struct ImFontAtlas;

// Helpers to build glyph ranges from text data. Feed all your application strings/characters to it then call BuildRanges().
// TODO:
// struct ImFontAtlas_GlyphRangesBuilder
// {
//     import std.bitmanip;
//     import std.string : fromStringz;
// 	import std.array : appender;
//     BitArray UsedChars;

//     void init() { if(UsedChars.length == 0) UsedChars.length = 0x10000; }
//     bool GetBit(int n) { return UsedChars[n]; }
//     void SetBit(int n) { UsedChars[n] = true; }  // Set bit 'c' in the array
//     void AddChar(ImWchar c) { init(); UsedChars[c] = true; }        // Add character
//     void AddText(const(char)* text, const(char)* text_end = null)   // Add string (each character of the UTF-8 string are added)
//     {
//         init();
//         const(char)[] s = text_end ? text[0..(text_end - text)] : text.fromStringz;
//         foreach(dchar c; s) {
//             if (c < 0x10000)
//                 UsedChars[c] = true;
//         }
//     }

//     void AddRanges(const(ImWchar)* ranges)                          // Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault) to force add all of ASCII/Latin+Ext
//     {
//         init();
//         for (; ranges[0]; ranges += 2)
//             for (ImWchar c = ranges[0]; c <= ranges[1]; c++)
//                 UsedChars[c] = true;
//     }

//     ImWchar[] BuildRanges()                                         // Output new ranges
//     {
//         init();
//         auto r = appender!(ImWchar[]);
//         for (int n = 0; n < 0x10000; n++)
//             if (UsedChars[n])
//             {
//                 r ~= cast(ImWchar)n;
//                 while (n < 0x10000-1 && UsedChars[n + 1])
//                     n++;
//                 r ~= cast(ImWchar)n;
//             }
//         r ~= cast(ImWchar)0;
//         return r.data;
//     }
// }

//struct ImFont;

struct ImFont_Glyph {
    ImWchar                 Codepoint;
    float                   XAdvance;
    float                   X0, Y0, X1, Y1;
    float                   U0, V0, U1, V1;     // Texture coordinates
}

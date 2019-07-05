/*
 * Copyright (c) 2017 Derelict Developers
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
module imgui.funcs;

@safe:
private
{
  import imgui.types;
  import core.stdc.stdarg:va_list;
}

extern(C) @nogc nothrow
{
  ImGuiIO* igGetIO();
  ImGuiStyle* igGetStyle();
  ImDrawData* igGetDrawData();
  void igNewFrame();
  void igEndFrame();
  void igRender();
  void igShutdown();
  void igShowDemoWindow(bool* p_open = null);
  void igShowMetricsWindow(bool* p_open = null);
  void igShowStyleEditor(ImGuiStyle* ref_ = null);
  bool igShowStyleSelector(const char* label = null);
  void igShowFontSelector(const char* label = null);
  void igShowUserGuide();

  // Window
  bool igBegin(const char* name, bool* p_opened = null, ImGuiWindowFlags flags = 0);
  void igEnd();
  bool igBeginChild(const char* str_id, const ImVec2 size = ImVec2(0, 0), bool border = false, ImGuiWindowFlags extra_flags = 0);
  bool igBeginChildEx(ImGuiID id, const ImVec2 size = ImVec2(0, 0), bool border = false, ImGuiWindowFlags extra_flags = 0);
  void igEndChild();
  void igGetContentRegionMax(ImVec2* outParam);
  void igGetContentRegionAvail(ImVec2* outParam);
  float igGetContentRegionAvailWidth();
  void igGetWindowContentRegionMin(ImVec2* outParam);
  void igGetWindowContentRegionMax(ImVec2* outParam);
  float igGetWindowContentRegionWidth();
  ImDrawList* igGetWindowDrawList();
  void igGetWindowPos(ImVec2* outParam);
  void igGetWindowSize(ImVec2* outParam);
  float igGetWindowWidth();
  float igGetWindowHeight();
  bool igIsWindowCollapsed();
  void igSetWindowFontScale(float scale);

  void igSetNextWindowPos(const ImVec2 pos, ImGuiCond cond = 0, const ImVec2 pivot = ImVec2(0,0));
  void igSetNextWindowSize(const ImVec2 size, ImGuiCond cond = 0);
  void igSetNextWindowSizeConstraints(const ImVec2 size_min, const ImVec2 size_max, ImGuiSizeConstraintCallback custom_callback = null, void* custom_callback_data = null);
  void igSetNextWindowContentSize(const ImVec2 size);
  void igSetNextWindowCollapsed(bool collapsed, ImGuiCond cond = 0);
  void igSetNextWindowFocus();
  void igSetWindowPos(const ImVec2 pos, ImGuiCond cond = 0);
  void igSetWindowSize(const ImVec2 size, ImGuiCond cond = 0);
  void igSetWindowCollapsed(bool collapsed, ImGuiCond cond = 0);
  void igSetWindowFocus();
  void igSetWindowPosByName(const char* name, const ImVec2 pos, ImGuiCond cond = 0);
  void igSetWindowSize2(const char* name, const ImVec2 size, ImGuiCond cond = 0);
  void igSetWindowCollapsed2(const char* name, bool collapsed, ImGuiCond cond = 0);
  void igSetWindowFocus2(const char* name);

  float igGetScrollX();
  float igGetScrollY();
  float igGetScrollMaxX();
  float igGetScrollMaxY();
  void igSetScrollX(float scroll_x);
  void igSetScrollY(float scroll_y);
  void igSetScrollHere(float center_y_ratio = 0.5f);
  void igSetScrollFromPosY(float pos_y, float center_y_ratio = 0.5f);
  void igSetKeyboardFocusHere(int offset = 0);
  void igSetStateStorage(ImGuiStorage* tree);
  ImGuiStorage* igGetStateStorage();

  void igPushFont(ImFont* font);
  void igPopFont();
  void igPushStyleColorU32(ImGuiCol idx, ImU32 col);
  void igPushStyleColor(ImGuiCol idx, const ImVec4 col);
  void igPopStyleColor(int count = 1);
  void igPushStyleVar(ImGuiStyleVar idx, float val);
  void igPushStyleVarVec(ImGuiStyleVar idx, const ImVec2 val);
  void igPopStyleVar(int count = 1);
  void igGetStyleColorVec4(ImVec4* pout, ImGuiCol idx);
  ImFont* igGetFont();
  float igGetFontSize();
  void igGetFontTexUvWhitePixel(ImVec2* pOut);
  ImU32 igGetColorU32(ImGuiCol idx, float alpha_mul = 1.0f);
  ImU32 igGetColorU32Vec(const ImVec4* col);
  ImU32 igGetColorU32U32(ImU32 col);

  void igPushItemWidth(float item_width);
  void igPopItemWidth();
  float igCalcItemWidth();
  void igPushTextWrapPos(float wrap_pos_x = 0.0f);
  void igPopTextWrapPos();
  void igPushAllowKeyboardFocus(bool v);
  void igPopAllowKeyboardFocus();
  void igPushButtonRepeat(bool repeat);
  void igPopButtonRepeat();

  void igSeparator();
  void igSameLine(float pos_x = 0.0f, float spacing_w = -1.0f);
  void igNewLine();
  void igSpacing();
  void igDummy(const ImVec2* size);
  void igIndent(float indent_w = 0.0f);
  void igUnindent(float indent_w = 0.0f);
  void igBeginGroup();
  void igEndGroup();
  void igGetCursorPos(ImVec2* pOut);
  float igGetCursorPosX();
  float igGetCursorPosY();
  void igSetCursorPos(const ImVec2 locl_pos);
  void igSetCursorPosX(float x);
  void igSetCursorPosY(float y);
  void igGetCursorStartPos(ImVec2* pOut);
  void igGetCursorScreenPos(ImVec2* pOut);
  void igSetCursorScreenPos(const ImVec2 pos);
  void igAlignTextToFramePadding();
  float igGetTextLineHeight();
  float igGetTextLineHeightWithSpacing();
  float igGetFrameHeightWithSpacing();

  void igColumns(int count = 1, const char* id = null, bool border = true);
  void igNextColumn();
  int igGetColumnIndex();
  float igGetColumnWidth(int column_index = -1);
  void igSetColumnWidth(int column_index, float width);
  float igGetColumnOffset(int column_index = -1);
  void igSetColumnOffset(int column_index, float offset_x);
  int igGetColumnsCount();

  void igPushIDStr(const char* str_id);
  void igPushIDStrRange(const char* str_begin, const char* str_end);
  void igPushIDPtr(const void* ptr_id);
  void igPushIDInt(int int_id);
  void igPopID();
  ImGuiID  igGetIDStr(const char* str_id);
  ImGuiID  igGetIDStrRange(const char* str_begin, const char* str_end);
  ImGuiID  igGetIDPtr(const void* ptr_id);

  void igText(const char* fmt, ...);
  void igTextV(const char* fmt, va_list args);
  void igTextColored(const ImVec4 col, const char* fmt, ...);
  void igTextColoredV(const ImVec4 col, const char* fmt, va_list args);
  void igTextDisabled(const char* fmt, ...);
  void igTextDisabledV(const char* fmt, va_list args);
  void igTextWrapped(const char* fmt, ...);
  void igTextWrappedV(const char* fmt, va_list args);
  void igTextUnformatted(const char* text, const char* text_end = null);
  void igLabelText(const char* label, const char* fmt, ...);
  void igLabelTextV(const char* label, const char* fmt, va_list args);
  void igBullet();
  void igBulletText(const char* fmt, ...);
  void igBulletTextV(const char* fmt, va_list args);
  bool igButton(const char* label, const ImVec2 size = ImVec2(0, 0));
  bool igSmallButton(const char* label);
  bool igInvisibleButton(const char* str_id, const ImVec2 size);
  void igImage(ImTextureID user_texture_id, const ImVec2 size, const ImVec2 uv0 = ImVec2(0, 0), const ImVec2 uv1 = ImVec2(1, 1), const ImVec4 tint_col = ImVec4(1, 1, 1, 1), const ImVec4 border_col = ImVec4(0, 0, 0, 0));
  bool igImageButton(ImTextureID user_texture_id, const ImVec2 size, const ImVec2 uv0 = ImVec2(0, 0), const ImVec2 uv1 = ImVec2(1, 1), int frame_padding = -1, const ImVec4 bg_col = ImVec4(0, 0, 0, 0), const ImVec4 tint_col = ImVec4(1, 1, 1, 1));
  bool igCheckbox(const char* label, bool* v);
  bool igCheckboxFlags(const char* label, uint* flags, uint flags_value);
  bool igRadioButtonBool(const char* label, bool active);
  bool igRadioButton(const char* label, int* v, int v_button);
  bool igCombo(const char* label, int* current_item, const char** items, int items_count, int height_in_items = -1);
  bool igCombo2(const char* label, int* current_item, const char* items_separated_by_zeros, int height_in_items = -1);
  bool igCombo3(const char* label, int* current_item, bool function(void* data, int idx, const(char)** out_text) items_getter, void* data, int items_count, int height_in_items = -1);
  void igPlotLines(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = null, float scale_min = float.max, float scale_max = float.max, ImVec2 graph_size = ImVec2(0, 0), size_t stride = float.sizeof);
  void igPlotLines2(const char* label, float function(void* data, int idx) values_getter, void* data, int values_count, int values_offset = 0, const char* overlay_text = null, float scale_min = float.max, float scale_max = float.max, ImVec2 graph_size = ImVec2(0, 0));
  void igPlotHistogram(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = null, float scale_min = float.max, float scale_max = float.max, ImVec2 graph_size = ImVec2(0, 0), size_t stride = float.sizeof);
  void igPlotHistogram2(const char* label, float function(void* data, int idx) values_getter, void* data, int values_count, int values_offset = 0, const char* overlay_text = null, float scale_min = float.max, float scale_max = float.max, ImVec2 graph_size = ImVec2(0, 0));
  void igProgressBar(float fraction, const ImVec2* size_arg /+= ImVec2(-1,0)+/, const(char)* overlay = null);

  bool igDragFloat(const char* label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);     // If v_max >= v_max we have no bound
  bool igDragFloat2(const char* label, ref float[2] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
  bool igDragFloat3(const char* label, ref float[3] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
  bool igDragFloat4(const char* label, ref float[4] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", float power = 1.0f);
  bool igDragFloatRange2(const char* label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* display_format = "%.3f", const char* display_format_max = null, float power = 1.0f);
  bool igDragInt(const char* label, int* v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.3f");                                       // If v_max >= v_max we have no bound
  bool igDragInt2(const char* label, ref int[2] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.3f");
  bool igDragInt3(const char* label, ref int[3] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.3f");
  bool igDragInt4(const char* label, ref int[4] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.3f");
  bool igDragIntRange2(const char* label, int* v_current_min, int* v_current_max, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* display_format = "%.0f", const char* display_format_max = null);

  bool igInputText(const char* label, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiTextEditCallback callback = null, void* user_data = null);
  bool igInputTextMultiline(const char* label, char* buf, size_t buf_size, const ImVec2 size = ImVec2(0,0), ImGuiInputTextFlags flags = 0, ImGuiTextEditCallback callback = null, void* user_data = null);
  bool igInputFloat(const char* label, float* v, float step = 0.0f, float step_fast = 0.0f, int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
  bool igInputFloat2(const char* label, ref float[2] v, int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
  bool igInputFloat3(const char* label, ref float[3] v, int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
  bool igInputFloat4(const char* label, ref float[4] v, int decimal_precision = -1, ImGuiInputTextFlags extra_flags = 0);
  bool igInputInt(const char* label, int* v, int step = 1, int step_fast = 100, ImGuiInputTextFlags extra_flags = 0);
  bool igInputInt2(const char* label, ref int[2] v, ImGuiInputTextFlags extra_flags = 0);
  bool igInputInt3(const char* label, ref int[3] v, ImGuiInputTextFlags extra_flags = 0);
  bool igInputInt4(const char* label, ref int[4] v, ImGuiInputTextFlags extra_flags = 0);

  bool igSliderFloat(const char* label, float* v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
  bool igSliderFloat2(const char* label, ref float[2] v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
  bool igSliderFloat3(const char* label, ref float[3] v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
  bool igSliderFloat4(const char* label, ref float[4] v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
  bool igSliderAngle(const char* label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f);
  bool igSliderInt(const char* label, int* v, int v_min, int v_max, const char* display_format = "%.0f");
  bool igSliderInt2(const char* label, ref int[2] v, int v_min, int v_max, const char* display_format = "%.0f");
  bool igSliderInt3(const char* label, ref int[3] v, int v_min, int v_max, const char* display_format = "%.0f");
  bool igSliderInt4(const char* label, ref int[4] v, int v_min, int v_max, const char* display_format = "%.0f");
  bool igVSliderFloat(const char* label, const ImVec2 size, float* v, float v_min, float v_max, const char* display_format = "%.3f", float power = 1.0f);
  bool igVSliderInt(const char* label, const ImVec2 size, int* v, int v_min, int v_max, const char* display_format = "%.0f");

  bool igColorEdit3(const char* label, ref float[3] col, ImGuiColorEditFlags flags = 0);
  bool igColorEdit4(const char* label, ref float[4] col, ImGuiColorEditFlags flags = 0);
  bool igColorPicker3(const char* label, ref float[3] col, ImGuiColorEditFlags flags = 0);
  bool igColorPicker4(const char* label, ref float[4] col, ImGuiColorEditFlags flags = 0, const float* ref_col = null);
  bool igColorButton(const char* desc_id, const ImVec4 col, ImGuiColorEditFlags flags = 0, ImVec2 size = ImVec2(0,0));  // display a colored square/button, hover for details, return true when pressed.
  void igSetColorEditOptions(ImGuiColorEditFlags flags);

  bool igTreeNode(const char* str_label_id);
  bool igTreeNodeStr(const char* str_id, const char* fmt, ...);
  bool igTreeNodePtr(const void* ptr_id, const char* fmt, ...);
  bool igTreeNodeStrV(const char* str_id, const char* fmt, va_list args);
  bool igTreeNodePtrV(const void* ptr_id, const char* fmt, va_list args);
  bool igTreeNodeEx(const char* label, ImGuiTreeNodeFlags flags);
  bool igTreeNodeExStr(const char* str_id, ImGuiTreeNodeFlags flags, const char* fmt, ...);
  bool igTreeNodeExPtr(const void* ptr_id, ImGuiTreeNodeFlags flags, const char* fmt, ...);
  bool igTreeNodeExV(const char* str_id, ImGuiTreeNodeFlags flags, const char* fmt, va_list args);
  bool igTreeNodeExVPtr(const void* ptr_id, ImGuiTreeNodeFlags flags, const char* fmt, va_list args);
  void igTreePushStr(const char* str_id = null);
  void igTreePushPtr(const void* ptr_id = null);
  void igTreePop();
  void igTreeAdvanceToLabelPos();
  float igGetTreeNodeToLabelSpacing();
  void igSetNextTreeNodeOpen(bool opened, ImGuiCond cond = 0);
  bool igCollapsingHeader(const char* label, ImGuiTreeNodeFlags flags = 0);
  bool igCollapsingHeaderEx(const char* label, bool* p_open, ImGuiTreeNodeFlags flags = 0);

  bool igSelectable(const char* label, bool selected = false, ImGuiSelectableFlags flags = 0, const ImVec2 size = ImVec2(0, 0));
  bool igSelectableEx(const char* label, bool* p_selected, ImGuiSelectableFlags flags = 0, const ImVec2 size = ImVec2(0, 0));
  bool igListBox(const char* label, int* current_item, const char** items, int items_count, int height_in_items = -1);
  bool igListBox2(const char* label, int* current_item, bool function(void* data, int idx, const char** out_text) items_getter, void* data, int items_count, int height_in_items = -1);
  bool igListBoxHeader(const char* label, const ImVec2 size = ImVec2(0, 0));
  bool igListBoxHeader2(const char* label, int items_count, int height_in_items = -1);
  void igListBoxFooter();

  void igValueBool(const char* prefix, bool b);
  void igValueInt(const char* prefix, int v);
  void igValueUInt(const char* prefix, uint v);
  void igValueFloat(const char* prefix, float v, const char* float_format = null);

  void igSetTooltip(const(char)* fmt, ...);
  void igSetTooltipV(const(char)* fmt, va_list args);
  void igBeginTooltip();
  void igEndTooltip();

  // Widgets: Menus
  bool igBeginMainMenuBar();
  void igEndMainMenuBar();
  bool igBeginMenuBar();
  void igEndMenuBar();
  bool igBeginMenu(const(char)* label, bool enabled = true);
  void igEndMenu();
  bool igMenuItem(const(char)* label, const(char)* shortcut = null, bool selected = false, bool enabled = true);
  bool igMenuItemPtr(const(char)* label, const(char)* shortcut, bool* p_selected, bool enabled = true);

  void igOpenPopup(const(char)* str_id);
  bool igBeginPopup(const(char)* str_id);
  bool igBeginPopupModal(const(char)* name, bool* p_opened = null, ImGuiWindowFlags extra_flags = 0);
  bool igBeginPopupContextItem(const(char)* str_id, int mouse_button = 1);
  bool igBeginPopupContextWindow(const(char)* str_id = null, int mouse_button = 1, bool also_over_items = true);
  bool igBeginPopupContextVoid(const(char)* str_id = null, int mouse_button = 1);
  void igEndPopup();
  bool igIsPopupOpen(const(char)* str_id);
  void igCloseCurrentPopup();

  void igLogToTTY(int max_depth = -1);
  void igLogToFile(int max_depth = -1, const char* filename = null);
  void igLogToClipboard(int max_depth = -1);
  void igLogFinish();
  void igLogButtons();
  void igLogText(const char* fmt, ...);

  void igPushClipRect(const ImVec2 clip_rect_min, const ImVec2 clip_rect_max, bool intersect_with_current_clip_rect);
  void igPopClipRect();

  bool igIsItemHovered(ImGuiHoveredFlags flags = 0);
  bool igIsItemActive();
  bool igIsItemClicked(int mouse_button = 0);
  bool igIsItemVisible();
  bool igIsAnyItemHovered();
  bool igIsAnyItemActive();
  void igGetItemRectMin(ImVec2* pOut);
  void igGetItemRectMax(ImVec2* pOut);
  void igGetItemRectSize(ImVec2* pOut);
  void igSetItemAllowOverlap();
  bool igIsWindowFocused(ImGuiFocusedFlags flags = 0);
  bool igIsWindowHovered(ImGuiHoveredFlags flags = 0);
  bool igIsAnyWindowHovered();
  bool igIsRectVisible(const ImVec2 item_size);
  bool igIsRectVisible2(const ImVec2 rect_min, const ImVec2 rect_max);

  float igGetTime();
  int igGetFrameCount();
  const(char)* igGetStyleColorName(ImGuiCol idx);
  void igCalcItemRectClosestPoint(ImVec2* pOut, const ImVec2 pos, bool on_edge = false, float outward = +0.0f);
  void igCalcTextSize(ImVec2* pOut, const char* text, const char* text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f);
  void igCalcListClipping(int items_count, float items_height, int* out_items_display_start, int* out_items_display_end);

  bool igBeginChildFrame(ImGuiID id, const ImVec2 size, ImGuiWindowFlags extra_flags = 0);
  void igEndChildFrame();

  void igColorConvertU32ToFloat4(ImVec4* pOut, ImU32 in_);
  ImU32 igColorConvertFloat4ToU32(const ImVec4 in_);
  void igColorConvertRGBtoHSV(float r, float g, float b, scope float* out_h, scope float* out_s, scope float* out_v);
  void igColorConvertHSVtoRGB(float h, float s, float v, scope float* out_r, scope float* out_g, scope float* out_b);

  int  igGetKeyIndex(ImGuiKey imgui_key);
  bool igIsKeyDown(int user_key_index);
  bool igIsKeyPressed(int user_key_index, bool repeat = true);
  bool igIsKeyReleased(int user_key_index);
  bool igIsMouseDown(int button);
  bool igIsMouseClicked(int button, bool repeat = false);
  bool igIsMouseDoubleClicked(int button);
  bool igIsMouseReleased(int button);
  bool igIsMouseDragging(int button = 0, float lock_threshold = -1.0f);
  bool igIsMouseHoveringRect(const ImVec2 r_min, const ImVec2 r_max, bool clip = true);
  bool igIsMousePosValid(const ImVec2* mouse_pos = null);
  void igGetMousePos(ImVec2* pOut);
  void igGetMousePosOnOpeningCurrentPopup(ImVec2* pOut);
  void igGetMouseDragDelta(ImVec2* pOut, int button = 0, float lock_threshold = -1.0f);
  void igResetMouseDragDelta(int button = 0);
  ImGuiMouseCursor igGetMouseCursor();
  void igSetMouseCursor(ImGuiMouseCursor type);
  void igCaptureKeyboardFromApp(bool capture = true);
  void igCaptureMouseFromApp(bool capture = true);

  void* igMemAlloc(size_t sz);
  void igMemFree(void* ptr);
  const(char)* igGetClipboardText();
  void igSetClipboardText(const(char)* text);

  const(char)* igGetVersion();
  ImGuiContext* igCreateContext(ImFontAtlas* shared_font_atlas);
  void igDestroyContext(ImGuiContext* ctx);
  ImGuiContext* igGetCurrentContext();
  void igSetCurrentContext(ImGuiContext* ctx);
}

extern(C) @nogc nothrow
{
  // ImGuiIO
  void ImGuiIO_AddInputCharacter(ushort c);
  void ImGuiIO_AddInputCharactersUTF8(const(char*) utf8_chars);
  void ImGuiIO_ClearInputCharacters();

  // ImGuiTextFilter
  ImGuiTextFilter* ImGuiTextFilter_Create(const char* default_filter = "");
  void ImGuiTextFilter_Destroy(ImGuiTextFilter* filter);
  void ImGuiTextFilter_Clear(ImGuiTextFilter* filter);
  bool ImGuiTextFilter_Draw(ImGuiTextFilter* filter, const char* label = "Filter (inc,-exc)", float width = 0.0f);
  bool ImGuiTextFilter_PassFilter(const(ImGuiTextFilter)* filter, const char* text, const char* text_end = null);
  bool ImGuiTextFilter_IsActive(const(ImGuiTextFilter)* filter);
  void ImGuiTextFilter_Build(ImGuiTextFilter* filter);
  const(char)* ImGuiTextFilter_GetInputBuf(ImGuiTextFilter* filter);

  bool ImFontAtlas_Build(ImFontAtlas* self);

  // ImGuiTextBuffer
  ImGuiTextBuffer* ImGuiTextBuffer_Create();
  void ImGuiTextBuffer_Destroy(ImGuiTextBuffer* buffer);
  char ImGuiTextBuffer_index(ImGuiTextBuffer* buffer, int i);
  const (char*) ImGuiTextBuffer_begin(const(ImGuiTextBuffer)* buffer);
  const (char*) ImGuiTextBuffer_end(const(ImGuiTextBuffer)* buffer);
  int ImGuiTextBuffer_size(const(ImGuiTextBuffer)* buffer);
  bool ImGuiTextBuffer_empty(ImGuiTextBuffer* buffer);
  void ImGuiTextBuffer_clear(ImGuiTextBuffer* buffer);
  const (char*) ImGuiTextBuffer_c_str(const(ImGuiTextBuffer)* buffer);
  void ImGuiTextBuffer_appendf(ImGuiTextBuffer* buffer, const(char)* fmt, ...);
  void  ImGuiTextBuffer_appendfv(ImGuiTextBuffer* buffer, const(char)* fmt, va_list args);

  // ImGuiStorage
  ImGuiStorage* ImGuiStorage_Create();
  void ImGuiStorage_Destroy(ImGuiStorage* storage);
  void ImGuiStorage_Clear(ImGuiStorage* storage);
  int ImGuiStorage_GetInt(ImGuiStorage* storage, ImGuiID key, int default_val);
  void ImGuiStorage_SetInt(ImGuiStorage* storage, ImGuiID key, int val);
  bool ImGuiStorage_GetBool(ImGuiStorage* storage, ImGuiID key, bool default_val);
  void ImGuiStorage_SetBool(ImGuiStorage* storage, ImGuiID key, bool val);
  float ImGuiStorage_GetFloat(ImGuiStorage* storage, ImGuiID key, float default_val);
  void ImGuiStorage_SetFloat(ImGuiStorage* storage, ImGuiID key, float val);
  void* ImGuiStorage_GetVoidPtr(ImGuiStorage* storage, ImGuiID key);
  void ImGuiStorage_SetVoidPtr(ImGuiStorage* storage, ImGuiID key, void* val);
  int* ImGuiStorage_GetIntRef(ImGuiStorage* storage, ImGuiID key, int default_val);
  bool* ImGuiStorage_GetBoolRef(ImGuiStorage* storage, ImGuiID key, bool default_val);
  float* ImGuiStorage_GetFloatRef(ImGuiStorage* storage, ImGuiID key, float default_val);
  void** ImGuiStorage_GetVoidPtrRef(ImGuiStorage* storage, ImGuiID key, void* default_val);
  void ImGuiStorage_SetAllInt(ImGuiStorage* storage, int val);

  // ImGuiTextEditCallbackData
  void ImGuiTextEditCallbackData_DeleteChars(ImGuiTextEditCallbackData* data, int pos, int bytes_count);
  void ImGuiTextEditCallbackData_InsertChars(ImGuiTextEditCallbackData* data, int pos, const char* text, const char* text_end = null);
  bool ImGuiTextEditCallbackData_HasSelection(ImGuiTextEditCallbackData* data);

  // ImGuiListClipper
  void ImGuiListClipper_Begin(ImGuiListClipper* clipper, int items_count, float items_height = -1.0f);
  void ImGuiListClipper_End(ImGuiListClipper* clipper);
  bool ImGuiListClipper_Step(ImGuiListClipper* clipper);
  int ImGuiListClipper_GetDisplayStart(ImGuiListClipper* clipper);
  int ImGuiListClipper_GetDisplayEnd(ImGuiListClipper* clipper);

  // ImDrawList
  ImDrawVert* ImDrawList_GetVertexPtr(ImDrawList* list, int n);
  ImDrawIdx* ImDrawList_GetIndexPtr(ImDrawList* list, int n);
  int ImDrawList_GetCmdSize(ImDrawList* list);
  ImDrawCmd* ImDrawList_GetCmdPtr(ImDrawList* list, int n);
  void ImDrawList_Clear(ImDrawList* list);
  void ImDrawList_ClearFreeMemory(ImDrawList* list);
  void ImDrawList_PushClipRect(ImDrawList* list, ImVec2 clip_rect_min, ImVec2 clip_rect_max, bool intersect_with_current_clip_rect = false);
  void ImDrawList_PushClipRectFullScreen(ImDrawList* list);
  void ImDrawList_PopClipRect(ImDrawList* list);
  void ImDrawList_PushTextureID(ImDrawList* list, const ImTextureID texture_id);
  void ImDrawList_PopTextureID(ImDrawList* list);
  void ImDrawList_GetClipRectMin(ImVec2 *pOut, ImDrawList* list);
  void ImDrawList_GetClipRectMax(ImVec2 *pOut, ImDrawList* list);
  void ImDrawList_AddLine(ImDrawList* list, const ImVec2 a, const ImVec2 b, ImU32 col, float thickness = 1.0f);
  void ImDrawList_AddRect(ImDrawList* list, const ImVec2 a, const ImVec2 b, ImU32 col, float rounding = 0.0f, int rounding_corners_flags = 0x0F, float thickness = 1.0f);
  void ImDrawList_AddRectFilled(ImDrawList* list, const ImVec2 a, const ImVec2 b, ImU32 col, float rounding = 0.0f, int rounding_corners_flags = 0x0F);
  void ImDrawList_AddRectFilledMultiColor(ImDrawList* list, const ImVec2 a, const ImVec2 b, ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left);
  void ImDrawList_AddQuad(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, ImU32 col, float thickness = 1.0f);
  void ImDrawList_AddQuadFilled(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, ImU32 col);
  void ImDrawList_AddTriangle(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 c, ImU32 col, float thickness = 1.0f);
  void ImDrawList_AddTriangleFilled(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 c, ImU32 col);
  void ImDrawList_AddCircle(ImDrawList* list, const ImVec2 centre, float radius, ImU32 col, int num_segments = 12, float thickness = 1.0f);
  void ImDrawList_AddCircleFilled(ImDrawList* list, const ImVec2 centre, float radius, ImU32 col, int num_segments = 12);
  void ImDrawList_AddText(ImDrawList* list, const ImVec2 pos, ImU32 col, const char* text_begin, const char* text_end = null);
  void ImDrawList_AddTextExt(ImDrawList* list, const ImFont* font, float font_size, const ImVec2 pos, ImU32 col, const char* text_begin, const char* text_end = null, float wrap_width = 0.0f, const ImVec4* cpu_fine_clip_rect = null);
  void ImDrawList_AddImage(ImDrawList* list, ImTextureID user_texture_id, const ImVec2 a, const ImVec2 b, const ImVec2 uv_a = ImVec2(0,0), const ImVec2 uv_b = ImVec2(1,1), ImU32 col = 0xFFFFFFFF);
  void ImDrawList_AddImageQuad(ImDrawList* list, ImTextureID user_texture_id, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, const ImVec2 uv_a = ImVec2(0,0), const ImVec2 uv_b = ImVec2(1,0), const ImVec2 uv_c = ImVec2(1,1), const ImVec2 uv_d = ImVec2(0,1), ImU32 col = 0xFFFFFFFF);
  void ImDrawList_AddPolyline(ImDrawList* list, const ImVec2* points, const int num_points, ImU32 col, bool closed, float thickness);
  void ImDrawList_AddConvexPolyFilled(ImDrawList* list, const ImVec2* points, const int num_points, ImU32 col, bool anti_aliased);
  void ImDrawList_AddBezierCurve(ImDrawList* list, const ImVec2 pos0, const ImVec2 cp0, const ImVec2 cp1, const ImVec2 pos1, ImU32 col, float thickness, int num_segments = 0);
  void ImDrawList_PathClear(ImDrawList* list);
  void ImDrawList_PathLineTo(ImDrawList* list, const ImVec2 pos);
  void ImDrawList_PathLineToMergeDuplicate(ImDrawList* list, const ImVec2 pos);
  void ImDrawList_PathFillConvex(ImDrawList* list, ImU32 col);
  void ImDrawList_PathStroke(ImDrawList* list, ImU32 col, bool closed, float thickness = 1.0f);
  void ImDrawList_PathArcTo(ImDrawList* list, const ImVec2 centre, float radius, float a_min, float a_max, int num_segments = 10);
  void ImDrawList_PathArcToFast(ImDrawList* list, const ImVec2 centre, float radius, int a_min_of_12, int a_max_of_12);
  void ImDrawList_PathBezierCurveTo(ImDrawList* list, const ImVec2 p1, const ImVec2 p2, const ImVec2 p3, int num_segments = 0);
  void ImDrawList_PathRect(ImDrawList* list, const ImVec2 rect_min, const ImVec2 rect_max, float rounding = 0.0f, int rounding_corners_flags = 0x0F);
  void ImDrawList_ChannelsSplit(ImDrawList* list, int channels_count);
  void ImDrawList_ChannelsMerge(ImDrawList* list);
  void ImDrawList_ChannelsSetCurrent(ImDrawList* list, int channel_index);
  void ImDrawList_AddCallback(ImDrawList* list, ImDrawCallback callback, void* callback_data);
  void ImDrawList_AddDrawCmd(ImDrawList* list);
  void ImDrawList_PrimReserve(ImDrawList* list, int idx_count, int vtx_count);
  void ImDrawList_PrimRect(ImDrawList* list, const ImVec2 a, const ImVec2 b, ImU32 col);
  void ImDrawList_PrimRectUV(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 uv_a, const ImVec2 uv_b, ImU32 col);
  void ImDrawList_PrimQuadUV(ImDrawList* list, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, const ImVec2 uv_a, const ImVec2 uv_b, const ImVec2 uv_c, const ImVec2 uv_d, ImU32 col);
  void ImDrawList_PrimVtx(ImDrawList* list, const ImVec2 pos, const ImVec2 uv, ImU32 col);
  void ImDrawList_PrimWriteVtx(ImDrawList* list, const ImVec2 pos, const ImVec2 uv, ImU32 col);
  void ImDrawList_PrimWriteIdx(ImDrawList* list, ImDrawIdx idx);
  void ImDrawList_UpdateClipRect(ImDrawList* list);
  void ImDrawList_UpdateTextureID(ImDrawList* list);

  // ImDrawData
  void ImDrawData_DeIndexAllBuffers(ImDrawData* drawData);
  void ImDrawData_ScaleClipRects(ImDrawData* drawData, const ImVec2 sc);

  // ImFontAtlas
  ImFont* ImFontAtlas_AddFont(ImFontAtlas* atlas, const ImFontConfig* font_cfg);
  ImFont* ImFontAtlas_AddFontDefault(ImFontAtlas* atlas, const ImFontConfig* font_cfg = null);
  ImFont* ImFontAtlas_AddFontFromFileTTF(ImFontAtlas* atlas, const char* filename, float size_pixels, const ImFontConfig* font_cfg = null, const(ImWchar)* glyph_ranges = null);
  ImFont* ImFontAtlas_AddFontFromMemoryTTF(void* font_data, int font_size, float size_pixels, const ImFontConfig* font_cfg = null, const(ImWchar)* glyph_ranges = null);
  ImFont* ImFontAtlas_AddFontFromMemoryCompressedTTF(const void* compressed_font_data, int compressed_font_size, float size_pixels, const ImFontConfig* font_cfg = null, const(ImWchar)* glyph_ranges = null);
  ImFont* ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(const char* compressed_font_data_base85, float size_pixels, const ImFontConfig* font_cfg = null, const(ImWchar)* glyph_ranges = null);
  void ImFontAtlas_ClearTexData(ImFontAtlas* atlas);
  void ImFontAtlas_ClearInputData(ImFontAtlas* atlas);
  void ImFontAtlas_ClearFonts(ImFontAtlas* atlas);
  void ImFontAtlas_Clear(ImFontAtlas* atlas);

  void ImFontAtlas_GetTexDataAsAlpha8(ImFontAtlas* atlas,scope ubyte** out_pixels,scope int* out_width,scope int* out_height,scope int* out_bytes_per_pixel = null);
  void ImFontAtlas_GetTexDataAsRGBA32(ImFontAtlas* atlas,scope ubyte** out_pixels,scope int* out_width,scope int* out_height,scope int* out_bytes_per_pixel = null);
  void ImFontAtlas_SetTexID(ImFontAtlas* atlas, ImTextureID id);

  const(ImWchar)* ImFontAtlas_GetGlyphRangesDefault(ImFontAtlas* atlas);
  const(ImWchar)* ImFontAtlas_GetGlyphRangesKorean(ImFontAtlas* atlas);
  const(ImWchar)* ImFontAtlas_GetGlyphRangesJapanese(ImFontAtlas* atlas);
  const(ImWchar)* ImFontAtlas_GetGlyphRangesChinese(ImFontAtlas* atlas);
  const(ImWchar)* ImFontAtlas_GetGlyphRangesCyrillic(ImFontAtlas* atlas);
  const(ImWchar)* ImFontAtlas_GetGlyphRangesThai(ImFontAtlas* atlas);

  ImTextureID ImFontAtlas_GetTexID(ImFontAtlas* atlas);
  ubyte* ImFontAtlas_GetTexPixelsAlpha8(ImFontAtlas* atlas);
  uint* ImFontAtlas_GetTexPixelsRGBA32(ImFontAtlas* atlas);
  int ImFontAtlas_GetTexWidth(ImFontAtlas* atlas);
  int ImFontAtlas_GetTexHeight(ImFontAtlas* atlas);
  int ImFontAtlas_GetTexDesiredWidth(ImFontAtlas* atlas);
  void ImFontAtlas_SetTexDesiredWidth(ImFontAtlas* atlas, int TexDesiredWidth_);
  int ImFontAtlas_GetTexGlyphPadding(ImFontAtlas* atlas);
  void ImFontAtlas_SetTexGlyphPadding(ImFontAtlas* atlas, int TexGlyphPadding_);
  void ImFontAtlas_GetTexUvWhitePixel(ImFontAtlas* atlas, ImVec2* pOut);

  // ImFontAtlas::Fonts;
  int ImFontAtlas_Fonts_size(ImFontAtlas* atlas);
  ImFont* ImFontAtlas_Fonts_index(ImFontAtlas* atlas, int index);

  // ImFont
  float ImFont_GetFontSize(const ImFont* font);
  void ImFont_SetFontSize(ImFont* font, float FontSize_);
  float ImFont_GetScale(const ImFont* font);
  void ImFont_SetScale(ImFont* font, float Scale_);
  void ImFont_GetDisplayOffset(const ImFont* font, ImVec2* pOut);
  const (ImFont_Glyph*) ImFont_GetFallbackGlyph(const ImFont* font);
  void ImFont_SetFallbackGlyph(ImFont* font, const ImFont_Glyph* FallbackGlyph_);
  float ImFont_GetFallbackAdvanceX(const ImFont* font);
  ImWchar ImFont_GetFallbackChar(const ImFont* font);
  short ImFont_GetConfigDataCount(const ImFont* font);
  ImFontConfig* ImFont_GetConfigData(ImFont* font);
  ImFontAtlas* ImFont_GetContainerAtlas(ImFont* font);
  float ImFont_GetAscent(const ImFont* font);
  float ImFont_GetDescent(const ImFont* font);
  int ImFont_GetMetricsTotalSurface(const ImFont* font);

  void ImFont_ClearOutputData(const ImFont* font);
  void ImFont_BuildLookupTable(ImFont* font);
  const (ImFont_Glyph*) ImFont_FindGlyph(const ImFont* font, ImWchar c);
  void ImFont_SetFallbackChar(ImFont* font, ImWchar c);
  float ImFont_GetCharAdvance(const ImFont* font, ImWchar c);
  bool ImFont_IsLoaded(const ImFont* font);
  void ImFont_CalcTextSizeA(const ImFont* font, ImVec2* pOut, float size, float max_width, float wrap_width, const (char*) text_begin, const char* text_end = null, const char** remaining = null); // utf8
  const (char*) ImFont_CalcWordWrapPositionA(const ImFont* font, float scale, const char* text, const char* text_end, float wrap_width);
  void ImFont_RenderChar(const ImFont* font, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, ushort c);
  void ImFont_RenderText(const ImFont* font, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, const ImVec4* clip_rect, const char* text_begin, const char* text_end, float wrap_width = 0.0f, bool cpu_fine_clip = false);

  // ImFont::Glyphs
  int ImFont_Glyphs_size(const ImFont* font);
  ImFont_Glyph* ImFont_Glyphs_index(ImFont* font, int index);

  // ImFont::IndexXAdvance
  int ImFont_IndexXAdvance_size(const ImFont* font);
  float ImFont_IndexXAdvance_index(const ImFont* font, int index);

  // ImFont::IndexLookup
  int ImFont_IndexLookup_size(const ImFont* font);
  ushort ImFont_IndexLookup_index(const ImFont* font, int index);

}

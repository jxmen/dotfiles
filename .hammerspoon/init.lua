function escape()
	local inputSource = hs.keycodes.currentSourceID()
	local inputEnglish = "com.apple.keylayout.UnicodeHexInput"

	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	hs.eventtap.keyStroke({}, "escape")
end

--- 현재 사용중인 키보드 이름 표시
hs.hotkey.bind({ "cmd", "control" }, "i", function()
	local input_source = hs.keycodes.currentSourceID()
	print(input_source)
end)

--- ctrl + [ 키를 esc로 매핑 및 입력소스 변경
hs.hotkey.bind({ "control" }, 33, escape)
hs.hotkey.bind({ "cmd", "control" }, "delete", function()
	hs.eventtap.keyStroke({ "shift" }, "end")
	hs.eventtap.keyStroke({}, "delete")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")

--- 앱 실행 단축키
require("app_hotkeys")

APP_NAME = PathCopier
BUILD_DIR = .build
APPS_DIR = /Applications

.PHONY: build sign install all clean

all: build sign install
	@echo ""
	@echo "✅ PathCopier 已安装！"
	@echo ""
	@echo "👉 拖进 Finder 工具栏："
	@echo "   打开访达 → 按住 ⌘ 键"
	@echo "   把 /Applications/$(APP_NAME).app"
	@echo "   拖到窗口顶部工具栏（搜索框右边）"
	@echo ""
	@echo "之后选中文件 → 点一下图标 → 路径已复制 → ⌘V"

# 编译
build:
	@echo "=== 编译 ==="
	rm -rf $(BUILD_DIR)/$(APP_NAME).app
	mkdir -p $(BUILD_DIR)/$(APP_NAME).app/Contents/MacOS
	mkdir -p $(BUILD_DIR)/$(APP_NAME).app/Contents/Resources
	swiftc Sources/main.swift \
		-o $(BUILD_DIR)/$(APP_NAME).app/Contents/MacOS/$(APP_NAME) \
		-framework Foundation \
		-O -whole-module-optimization
	cp Info.plist $(BUILD_DIR)/$(APP_NAME).app/Contents/
	cp Resources/AppIcon.png $(BUILD_DIR)/$(APP_NAME).app/Contents/Resources/

# 签名（可选：有开发者证书时签名，否则跳过）
sign:
	@if security find-identity -v -p codesigning 2>/dev/null | grep -q "Apple Development"; then \
		printf "=== 签名 ===\n"; \
		printf '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n<plist version="1.0"><dict><key>com.apple.security.automation.apple-events</key><true/></dict></plist>\n' > /tmp/pcopier.plist; \
		codesign --force --options runtime --entitlements /tmp/pcopier.plist -s "Apple Development" --deep $(BUILD_DIR)/$(APP_NAME).app 2>/dev/null && \
		printf "✅ 已签名\n"; \
	else \
		printf "⚠️ 无开发者证书，跳过签名\n"; \
	fi

# 安装
install:
	@echo "=== 安装 ==="
	rm -rf $(APPS_DIR)/$(APP_NAME).app
	cp -R $(BUILD_DIR)/$(APP_NAME).app $(APPS_DIR)/

# 清理
clean:
	rm -rf $(BUILD_DIR)

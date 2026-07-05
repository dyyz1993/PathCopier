APP_NAME = PathCopier
BUILD_DIR = .build
APPS_DIR = /Applications

.PHONY: build install all clean

all: build install
	@echo ""
	@echo "✅ PathCopier 已安装！"
	@echo ""
	@echo "👉 拖进 Finder 工具栏："
	@echo "   打开访达 → 按住 ⌘ 键"
	@echo "   把 /Applications/$(APP_NAME).app"
	@echo "   拖到窗口顶部工具栏（搜索框右边）"
	@echo ""
	@echo "之后选中文件 → 点一下图标 → ⌘V"

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
	@echo "✅ 编译完成"

# 安装
install:
	@echo "=== 安装 ==="
	rm -rf $(APPS_DIR)/$(APP_NAME).app
	cp -R $(BUILD_DIR)/$(APP_NAME).app $(APPS_DIR)/
	@echo "✅ 已安装: $(APPS_DIR)/$(APP_NAME).app"

# 清理
clean:
	rm -rf $(BUILD_DIR)
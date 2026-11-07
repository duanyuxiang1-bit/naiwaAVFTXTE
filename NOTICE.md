# 来源与修改声明

奶蛙低占用 2D 版 0.6.5-preview，修改日期 2026-11-06。根据用户提供的参考图重建十二生肖和笑脸小奶蛙的模型、关节与操作姿势。模型生成代码按本项目 AGPL-3.0-only 提供。运行时使用从模型烘焙的固定视角图层。

本衍生组合程序按 **GNU Affero General Public License v3.0 only** 分发，完整文本随包提供。对应源码以同版本 `NaiwaLite-0.6.5-preview-Source.zip` 提供，分享集合为 `NaiwaLite-0.6.5-preview-Share.zip`。源码包含十四个 GLB 和模型生成代码。

## BongoCat

上游：https://github.com/vladelaina/BongoCat

固定提交：`29ccda67802e6b6727acae0bdf42f50277f9aade`。

复制的上游文件位于 `lite/third_party/BongoCat`：

- `input_state.c`、`windows_keys.c/.h`、`windows_input.h`、`include/bongo_cat/input.h`、`common.h`：来自上述提交。
- `windows_input.c`：在上游基础上将 SDL 唤醒/日志改为 Win32，过滤非配置键，增加被动 Raw Input 接收、滚轮反馈、合并唤醒和安全停止处理；不使用 SDL 或 Cubism。
- `include/bongo_cat/platform.h`：本项目新增的最小平台适配头，不是原版完整平台头。
- `lite/src/bongo-input.c/.h`：本项目新增 C ABI 适配层。

`third_party/BongoCat/LICENSE` 为原样 AGPL-3.0-only 文本。软件的绘制和窗口并非直接复制上游：绘制为 Win32 分层窗口的软件 2D 合成；托盘、设置和可选兼容助手从本项目原生版移植适配。没有使用或分发 BongoCat 的猫模型、品牌图标或 Live2D SDK。

## 奶蛙与构建运行库

本项目原有 MIT 授权代码、原生数学/窗口/模型导出代码被移植进入此 AGPL 组合程序；原始 MIT 版权声明保留于 `LICENSE.Naiwa-original.txt`。此许可不改变独立旧版本的原有授权。奶蛙定制署名：抖音W0Wsai。

MinGW-w64 运行库静态链接许可见 `COPYING.MinGW-w64-runtime.txt`。Windows 系统 DLL 不打包。不含 Electron/Chromium、SDL、OpenGL 或 D3D 渲染运行库。

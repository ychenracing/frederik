# ChatGPT Project Brief

> 本文件只保存长期稳定、仓库级的信息。当前任务、临时分支、SHA、测试状态和执行进度应保存在当前 Pull Request 正文中。

## 1. Project

- 项目名称：frederik
- GitHub 仓库：`ychenracing/frederik`
- 默认分支：`master`
- 系统定位：使用 Java Servlet、JSP 和静态前端资源构建的中英文马匹主题响应式网站。
- 项目最终目标：展示马匹、家族、新闻和图库内容，并提供对应的内容维护入口；更长期目标未在仓库文档中明确。

## 2. Purpose and Non-Goals

项目提供英文与中文两套页面和控制器，覆盖首页、马匹、家族、新闻、图库、登录、密码修改、上传和邮件发送等功能。

长期非目标未在仓库文档中明确。仓库未定义通用内容管理平台、微服务、移动客户端或独立 API 产品，不应自行假定这些职责。

## 3. Architecture and Module Boundaries

- `WebRoot/`：JSP、HTML、CSS、JavaScript、图片、上传内容和 Web 应用资源。
- `WebRoot/WEB-INF/web.xml`：Servlet 声明、URL 映射、欢迎页、会话和错误页配置。
- `src/cn/edu/fudan/controller/`：英文请求控制器；`controller/cn/` 提供对应中文控制器。
- `src/cn/edu/fudan/model/`：马匹、家族、新闻和用户相关的数据访问与修改逻辑。
- `src/cn/edu/fudan/entity/`：领域实体；`entity/cn/` 保存中文对应实体。
- `src/cn/edu/fudan/function/`：邮件、视频转换和数据转换等辅助能力。
- `WebRoot/WEB-INF/lib/`：仓库内置的 Servlet 应用依赖 JAR。

数据流：浏览器请求 → `web.xml` Servlet 映射 → controller → model/entity 或辅助函数 → JSP/资源响应。Servlet 映射是 Web 入口 Owner；controller 是请求流程 Owner；model/entity 是持久化访问和领域数据结构 Owner。治理文件不得成为第二份可执行路由、配置或数据模型。

## 4. Non-Negotiable Constraints

- 中英文页面、控制器和实体是并列的现有结构，修改一侧时必须评估另一侧的一致性。
- Servlet 名称、类名与 `web.xml` URL 映射必须保持一致。
- JSP、上传内容、数据库和邮件属于外部或运行时边界；不得把未核验的环境条件写成保证事实。
- 仓库包含旧式 Java Web 结构和内置 JAR；未定义依赖升级或现代化目标，不得擅自假定。
- 数据库、邮件或其他凭据不得复制到治理文档、PR 模板或日志中。
- 用户内容与上传文件的兼容性和安全影响必须按实际改动评估。

## 5. Authoritative Sources

- 项目定位：`README.md`
- 工程约定：`AGENTS.md`
- Web 应用入口和 Servlet 映射：`WebRoot/WEB-INF/web.xml`
- 页面和静态资源：`WebRoot/`
- 请求处理：`src/cn/edu/fudan/controller/`
- 领域实体：`src/cn/edu/fudan/entity/`
- 数据访问和修改逻辑：`src/cn/edu/fudan/model/`
- 辅助能力：`src/cn/edu/fudan/function/`
- 内置依赖：`WebRoot/WEB-INF/lib/`
- 构建、部署、数据库 schema、测试和发布权威来源：未在仓库文档中明确

## 6. Standard Commands

- 安装与依赖解析：未在仓库中定义；依赖以 JAR 形式保存在 `WebRoot/WEB-INF/lib/`。
- 构建和打包：未在仓库中定义。
- 本地运行和部署：未在仓库中定义；`web.xml` 表明项目需要兼容的 Java Servlet 容器，但容器、版本和部署命令未明确。
- 单元测试、集成测试、lint、类型检查和格式检查：未在仓库中定义。
- 关键验收命令：未在仓库中定义。

## 7. Important Paths

- `WebRoot/WEB-INF/web.xml`：Servlet 和 Web 应用配置。
- `WebRoot/WEB-INF/lib/`：内置依赖。
- `WebRoot/en/`：英文页面和资源。
- `WebRoot/cn/`：中文页面和资源。
- `src/cn/edu/fudan/controller/`：Servlet 控制器。
- `src/cn/edu/fudan/model/`：数据访问与修改逻辑。
- `src/cn/edu/fudan/entity/`：领域实体。
- `src/cn/edu/fudan/function/`：辅助功能。
- `README.md`：项目简介。
- `AGENTS.md`：渐进式验证约定。

## 8. CI and Acceptance Entry Points

- 仓库没有 `.github/workflows/`，未定义 GitHub Actions 构建、测试、lint 或发布门。
- 仓库未定义自动化测试入口；本地验证应遵循 `AGENTS.md` 的影响范围驱动原则。
- Definition of Done 的项目特有部分未在仓库中定义；涉及 Web 行为的变更至少应核对相关 Servlet 映射、控制器、模型和对应中英文页面，并记录实际完成的验证。

## 9. Prohibited Actions

- 不得把未在仓库中定义的构建、部署、数据库或测试命令写成权威命令。
- 不得在治理文件中记录数据库、邮件或其他凭据。
- 不得无意改变中英文路由、页面或数据语义。
- 不得擅自改写 Git 历史或 force push。
- 不得丢弃未知或未提交工作，也不得覆盖无关改动。
- 不得把计划执行写成已验证完成。
- 不得根据旧聊天猜测当前分支、SHA、PR 或 CI 状态。

## 10. Context Loading Protocol

1. 新开发任务可以直接使用自然语言提出，不要求预先填写固定 Prompt。
2. 开始任务时先读取本文件。
3. 搜索与任务相关的开放 PR、分支和 Issue。
4. 如果存在匹配工作，从现有现场原地继续。
5. 当前动态任务状态默认维护在 Pull Request 正文。
6. 不强制普通单 PR 任务创建 Issue。
7. 优先读取目标代码、直接调用者、相关测试和直接相关配置。
8. 只有证据不足、状态冲突或影响范围扩大时才扩大读取。
9. 不默认加载完整仓库、完整聊天、完整日志或全部 GitHub Actions 历史。
10. 长对话交接使用 `conversation-continuity-guard`，但 GitHub 当前现场仍是状态权威来源。

## 11. References

- `README.md`
- `AGENTS.md`
- `WebRoot/WEB-INF/web.xml`
- `WebRoot/`
- `src/cn/edu/fudan/controller/`
- `src/cn/edu/fudan/model/`
- `src/cn/edu/fudan/entity/`
- `src/cn/edu/fudan/function/`
- `WebRoot/WEB-INF/lib/`

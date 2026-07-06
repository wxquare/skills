# AI Skills Collection

[简体中文](./README.md) | [English](./README.en.md)

这是一个面向 AI 编码代理的可复用 skill 仓库，适用于 Codex、Claude Code 等支持 skill 触发与加载的环境。

这个仓库用来沉淀我在日常工程工作中会反复使用的工作流，并把它们整理成可触发、可复用、可验证的 skill，方便代理在遇到相似问题时稳定复用。

## 仓库定位

这些 skill 主要用于提升代理在常见工程任务中的一致性，例如：

- 代码评审
- 技术方案写作与审查
- 集成测试方案设计
- 集成测试结果整理
- 架构图与软件工程图生成

这个仓库的目标不是随意堆放 prompt，而是把高频工作沉淀为可复查、可维护、可验证的 skill 资产，持续改善代理的工作方式。

## 设计原则

这个仓库中的 skill 优先满足以下原则：

- 能跨项目复用，而不是绑定单一代码库
- 明确说明什么场景下应该触发
- 配有 references、示例和 non-goals
- 随 skill 增长仍然容易做校验和防漂移

每个核心 skill 预期至少包含：

- `SKILL.md` 作为主入口
- `references/test-prompts.md`，用于放典型触发示例
- `references/non-goals.md`，用于放不该触发的反例
- `agents/openai.yaml`，用于 UI 元数据或技能选择器集成

## Skill 目录

| Skill | 用途 | 目录 |
| --- | --- | --- |
| `code-review` | 审查 diff、patch、PR 和高风险代码改动，输出按优先级排序的 findings。 | [`code-review/`](./code-review/) |
| `excalidraw-diagram` | 选择合适的软件工程图类型，并生成适用于架构、流程、ERD、onboarding 和故障分析的 Excalidraw 图。 | [`excalidraw-diagram/`](./excalidraw-diagram/) |
| `news-source-digest` | 读取股票、人物和站点混合 watchlist，抓取最近资讯并输出带失败源的摘要简报。 | [`news-source-digest/`](./news-source-digest/) |
| `technical-design` | 编写或审查技术方案、架构设计、决策记录、灰度与回滚方案、风险评审文档。 | [`software-tech-design/`](./software-tech-design/) |
| `integration-test-plan` | 将 PRD、TD、diff 和 API 改动整理成可 review 的集成测试方案。 | [`software-testing/integration-test-plan/`](./software-testing/integration-test-plan/) |
| `integration-test-result` | 将已执行的集成测试结果整理成带证据、缺口和结论的结果报告。 | [`software-testing/integration-test-result/`](./software-testing/integration-test-result/) |

## 外部 Skill / Skill 套件

除了当前仓库内维护的通用工程 skill，我也会在这里记录值得长期使用的外部 skill 或领域型 skill 套件。

这些外部资源默认只做索引和说明，不直接拷贝进本仓库，避免：

- 上游更新难以同步
- 仓库边界变得混乱
- 外部项目的完整结构挤占当前 skill 集合

当前推荐：

| 名称 | 类型 | 说明 | 链接 |
| --- | --- | --- | --- |
| `InvestSkill / us-stock-analysis` | 领域型 skill 套件 | 面向美股研究与投资分析的 skill 集合，适合股票评估、估值、财报分析、技术分析、投资组合复盘等场景。 | [yennanliu/InvestSkill](https://github.com/yennanliu/InvestSkill) |

如果后续某个外部 skill 需要深度定制、统一验证资产，或必须适配当前仓库的结构规范，再考虑将其内部化。

## 仓库结构

大多数 skill 会遵循类似下面的目录结构：

```text
skill-name/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── test-prompts.md
│   ├── non-goals.md
│   └── ...
└── scripts/
    └── ...
```

含义如下：

- `SKILL.md`：skill 的主定义和核心工作流
- `agents/openai.yaml`：面向 UI 或技能选择器的人类可读元数据
- `references/`：支撑文档、示例、模板和验证资产
- `scripts/`：可选的辅助脚本，用于校验、渲染或重复性任务

## 验证

这个仓库已经补充了轻量级验证资产，避免 skill 在持续演进中悄悄漂移。

- 触发示例放在 `references/test-prompts.md`
- 反例放在 `references/non-goals.md`
- 静态检查可以通过下面命令运行：

```bash
./scripts/quick_validate.sh
```

## 使用说明

这些 skill 主要面向支持 skill 风格加载与触发的代理环境。

不同平台对 skill 的加载方式可能不同，但这个仓库尽量保持结构简单：

- 每个 skill 单独放在自己的目录
- 触发意图写在 `SKILL.md`
- 较重的说明和参考资料放进 `references/`

`news-source-digest` 的示例输入文件位于 `news-source-digest/examples/watchlist.yaml`，可以直接复制后替换成你的股票池和关注源。

## Roadmap

随着更多高频工作流被抽取成可复用 skill，这个仓库会持续扩展。

后续计划包括：

- 增加更多工程评审类 skill
- 增加更多测试和调试类 skill
- 增强验证与防漂移检查
- 为每个 skill 增加更清晰的 GitHub 对外文档

## License

目前还没有添加 License。

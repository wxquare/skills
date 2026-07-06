---
name: integration-test-plan
description: Use when generating or reviewing an integration-test plan from PRD, TD, MR, PR diff, API changes, or test scope notes; also use when the request mentions 集成测试方案, 测试计划, 测试范围, 风险覆盖, reviewable test plan, or review-ready test report before execution.
---

# Integration Test Plan

生成“可 review、可执行、可追溯”的集成测试方案报告，而不是直接生成测试代码。

## 适用场景

适合：

- 你已经拿到 `PRD + TD + MR/PR diff`，需要产出一份测试方案报告
- 改动以 API / 集成链路为主，需要明确测试范围、风险点、关键场景和非目标
- 希望在人工执行测试前，先让 AI 帮你把测试设计整理成标准文档
- 需要把“测什么、为什么测、怎么测、哪些不测”讲清楚

不适合：

- 直接要求生成可执行测试代码
- 只有零散日志，没有 PRD / TD / 变更上下文
- 目标是 UI / E2E agent 自动执行方案

## 输入要求

优先收集以下材料：

- `PRD`：需求目标、业务规则、非目标
- `TD`：方案设计、关键决策、依赖、风险、回滚
- `MR/PR diff`：真实代码改动范围
- `API spec / schema`：接口结构、字段、状态码
- `历史 case`：已有测试风格和覆盖习惯
- `目标环境`：国家/region、base URL、鉴权方式、测试账号或 cookie/token

如果输入不完整，不要猜。显式指出缺失项，并在报告里把它们写进 `Assumptions / Missing Inputs`。

公开仓库默认参考 [references/test-environments.pub.md](references/test-environments.pub.md)。
如果是内部仓库或内部交付，需要真实环境基线，再参考 [references/test-environments.private.md](references/test-environments.private.md)。

## 工作流

### Step 1：抽取改动摘要

先从输入材料中整理：

- 本次改动的业务目标
- 涉及的服务 / API / 集成链路
- 改动点属于新增、修改、兼容增强还是行为变更
- 哪些内容明确不在本轮测试范围

### Step 2：识别测试重点

至少覆盖以下视角：

- 主链路是否改变
- 输入输出结构是否改变
- 状态机 / 错误码 / 幂等语义是否改变
- 是否引入新依赖、新 fallback、新灰度逻辑
- 是否存在跨服务一致性或时序风险

### Step 3：生成测试方案报告

默认按以下结构输出：

1. `Background / Scope`
2. `Change Summary`
3. `Risk Analysis`
4. `Test Strategy`
5. `Test Case Proposal`
6. `Out of Scope`
7. `Review Items / Open Questions`

详细模板见 [references/plan-template.md](references/plan-template.md)。

### Step 4：输出质量要求

输出时遵守：

- 先讲范围和风险，再讲 case
- case 按业务链路或风险分组，而不是随意平铺
- 每个 case 至少说明：目标、前置条件、动作、预期结果
- 明确区分：
  - 本轮必须测
  - 建议测
  - 明确不测

## 快速检查清单

- [ ] 是否明确本次改动测什么、不测什么
- [ ] 是否明确最关键的 3-5 个风险点
- [ ] 是否把 API / 集成链路影响说清楚
- [ ] 是否给出可执行的 case 列表，而不是泛泛建议
- [ ] 是否列出人工需要重点确认的业务断言

## 常见错误

- 直接把 PRD/TD 改写成背景介绍，缺少测试重点
- 只列 happy path，没有负例、边界和异常流
- 把“需要补充输入”埋在正文里，没有单独指出
- 生成了很多 case，但没有区分优先级和范围

## 输出建议

默认输出使用中文，适合 review。必要时用表格组织：

- 改动摘要
- 风险点
- case 列表
- review items

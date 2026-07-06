---
name: integration-test-result
description: Use when summarizing executed integration tests into a reviewable result report after manual testing or CI runs; also use when the request mentions 测试结果报告, 测试执行结果, failed cases, blocked cases, logs, traces, coverage gaps, or release-readiness evidence after execution.
---

# Integration Test Result

生成“可 review、可沉淀、可复盘”的测试结果报告，而不是只给一堆执行日志。

## 适用场景

适合：

- 测试已经执行完，需要把结果整理成结构化报告
- 有测试结果、失败 case、日志、trace、执行备注，需要产出统一结论
- 希望把通过/失败/blocked/not run 和失败解释写清楚
- 需要为评审、复测或发布决策准备结果文档

不适合：

- 还没有执行测试，只是想设计测试方案
- 没有任何执行结果或失败证据
- 目标是自动修复代码，而不是整理结果

## 输入要求

优先收集以下材料：

- 测试方案报告
- 测试执行结果
- 失败 case 列表
- 日志 / trace / 错误码
- 执行备注（人工观察、blocked 原因、环境限制）
- 目标环境信息：国家/region、base URL、鉴权方式

公开仓库默认参考 [../integration-test-plan/references/test-environments.pub.md](../integration-test-plan/references/test-environments.pub.md)。
如果是内部仓库或内部交付，需要真实环境基线，再参考 [../integration-test-plan/references/test-environments.private.md](../integration-test-plan/references/test-environments.private.md)。

如果输入不全，要显式标明哪些结论是基于有限证据得出的。

## 工作流

### Step 1：汇总执行范围

先回答：

- 本轮实际执行了哪些内容
- 哪些 case 没执行
- 哪些 case 被阻塞
- 执行环境和前提是否满足原计划

### Step 2：归类结果

至少把 case 分成：

- `Pass`
- `Fail`
- `Blocked`
- `Not Run`

不要只给总数。对 `Blocked` 和 `Not Run` 必须写原因。

### Step 3：整理失败摘要

对每个失败 case，优先输出：

- 失败现象
- 相关日志 / trace / 错误码
- 初步判断：测试问题、环境问题、代码问题、依赖问题，或暂不明确
- 下一步建议

### Step 4：生成测试结果报告

默认按以下结构输出：

1. `Execution Summary`
2. `Case Result Summary`
3. `Failed Case Analysis`
4. `Coverage Gaps / Not Run Reasons`
5. `Risk Assessment`
6. `Final Recommendation`

详细模板见 [references/result-template.md](references/result-template.md)。

## 输出要求

- 结果先总览，再展开失败详情
- `Blocked` 和 `Not Run` 必须写清楚原因
- 失败归因要区分“有证据支持”与“待确认”
- 最后必须给出是否建议继续、重测、修复后重测或可进入下一阶段的结论

## 快速检查清单

- [ ] 是否明确本轮执行范围与计划范围的差异
- [ ] 是否把 Pass / Fail / Blocked / Not Run 分开
- [ ] 是否对每个失败 case 提供了证据或至少说明证据不足
- [ ] 是否对未执行项给出原因
- [ ] 是否有最终建议，而不是只罗列现象

## 常见错误

- 只贴执行日志，没有结构化结论
- 把失败现象写成结果，没有解释影响
- `Blocked` / `Not Run` 没原因
- 把 AI 猜测写成确定结论
- 没写这轮结果是否影响发布或后续测试

## 输出建议

默认输出使用中文，适合 review。优先使用表格整理：

- 执行摘要
- 结果分布
- 失败 case 分析
- 覆盖缺口
- 最终建议

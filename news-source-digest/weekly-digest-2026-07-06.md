# 新闻源周报 — 2026年第27周
**生成时间：** 2026年7月6日（周一）
**时间窗口：** 2026年6月29日（周一）— 7月5日（周日）
**覆盖源：** 55（5 股票、25 人物、25 站点）
**抓取成功：** 20+（部分源需登录或无法访问）
**有更新源：** 7

---

## 一、AI 与 LLM 生态

### DeepSeek — V4 系列发布 🚀

- **DeepSeek-V4 Preview 上线** — 官网 banner 宣布 V4 预览版，提供 Flash（快速，2500并发）和 Pro（全能力推理，500并发）两个版本，均支持 1M 上下文、384K 最大输出 Token。
  - 🔗 https://www.deepseek.com/
  - 📅 窗口内可见（精确发布日期未标注）

- **DeepSeek V4 API 定价公布** — V4-Flash $0.14/M 输入(cache miss), $0.28/M 输出；V4-Pro $0.435/M 输入, $0.87/M 输出。老模型名 `deepseek-chat` / `deepseek-reasoner` 将于 **2026/7/24 15:59 UTC** 下线。
  - 🔗 https://api-docs.deepseek.com/quick_start/pricing

- **DeepSeek V4 DSpark 变体发布**（7月4日）— 在 Hugging Face 上发布 `DeepSeek-V4-Flash-DSpark`（65.8K 下载）和 `DeepSeek-V4-Pro-DSpark`（14.3K 下载），新增 vLLM 代码片段。
  - 🔗 https://huggingface.co/deepseek-ai

- **DeepSeek GitHub** — 35 个公开仓库，本周无新仓库/新 Release。重点项目：DeepSeek-OCR（23.5K★）、FlashMLA（12.7K★）、3FS（10K★）。
  - 🔗 https://github.com/deepseek-ai

- **DeepSeek 状态** — 100% 正常运行，窗口内无事故。
  - 🔗 https://status.deepseek.com/

### Nous Research / Hermes Agent

- **Hermes Agent v0.18.0 "The Judgment Release" 发布**（7月1日）— 重大版本：~1720 commits、998 合并 PR、关闭 100% P0/P1 Issue（约 700 项）。新特性：Mixture-of-Agents 作为一等公民、`/goal` 完成度合约、`/learn` + `/journey` 自我进化、可部署 Gateway（scale-to-zero）、桌面编程项目、Memory Graph、后台子代理执行。
  - 🔗 https://github.com/NousResearch/hermes-agent
  - ⭐ 210K Stars

- **Nous Research GitHub** — 88 个仓库，最新开发: hermes-telegram-business、wandb-rs（Rust W&B 客户端）、RL fork from NVIDIA-NeMo、speculators fork from vllm-project。7月6日仍有多个 bugfix 提交。

- **Nous Research HF** — 窗口内无新模型。最新模型 `moe-10b-a1b-8k-wsd-lr3e4-1t`（4月1日）。

- **NousResearch.com** — ❌ 无法访问（连接超时）。

- **arXiv 论文** — 窗口内无新的 Nous/Hermes 相关论文。

### Anthropic 动态

- **Claude Sonnet 5 发布**（6月30日）— 性能接近 Opus 4.8，价格更低。百万 Token 上下文窗口、128K 最大输出。不再支持 `temperature`/`top_p`/`top_k` 采样参数。新 Tokenizer 导致英文文本 Token 增加 ~30%（实际涨价）。定价 $3/M 输入、$15/M 输出（8月31日前折扣价 $2/$10）。
  - 🔗 https://www.anthropic.com/news/claude-sonnet-5

- **Claude Fable 5 / Mythos 5 出口限制解除**（6月30日）— 美国商务部已解除对 Fable 5 和 Mythos 5 的出口管制，Anthropic 将逐步恢复访问。
  - 🔗 https://simonwillison.net/2026/Jun/30/anthropic/

---

## 二、人物博客

### Simon Willison（非常活跃 — 窗口内 14+ 篇文章）

1. **sqlite-utils 4.0rc2，由 Claude Fable 编写（成本约 $149.25）**（7月5日）
   - 使用 Claude Fable 5 和 GPT-5.5 交叉审查代码，发现并修复了多个关键 bug（如 `delete_where()` 不提交事务导致数据丢失）。最终成本 $149.25，37 次提示，34 次提交。
   - 🔗 https://simonwillison.net/2026/Jul/5/sqlite-utils-fable/

2. **Better Models: Worse Tools**（7月4日）— Armin Ronacher 发现新版 Claude 模型在第三方工具（如 Pi）上的工具调用模式变差，推测是因为新模型针对 Claude Code 内置编辑工具做了 RL 训练，导致泛化能力下降。
   - 🔗 https://simonwillison.net/2026/Jul/4/better-models-worse-tools/

3. **Fable's judgement**（7月3日）— 学到让 Claude Fable 自行判断用哪个模型执行子任务，而不是硬编码策略，从而更高效地使用 Fable Token 配额。
   - 🔗 https://simonwillison.net/2026/Jul/3/judgement/

4. **llm-coding-agent 0.1a0**（7月2日）— 基于 LLM 库的实验性编码代理，支持文件读写、命令执行、搜索等工具。可通过 `uvx --prerelease=allow --with llm-coding-agent llm code` 运行。
   - 🔗 https://simonwillison.net/2026/Jul/2/llm-coding-agent/

5. **Using DSPy to evaluate and improve Datasette Agent's SQL system prompts**（7月2日）— 用 DSPy 评估和改进 Datasette Agent 的系统提示，发现了列名猜测等优化方向。
   - 🔗 https://simonwillison.net/2026/Jul/2/dspy-datasette-agent-prompts/

6. **Understand to participate**（7月2日）— Geoffrey Litt 在 AIE 会议上的演讲：理解代码才能有效参与编码代理的协作过程，避免认知债务。
   - 🔗 https://simonwillison.net/2026/Jul/2/understand-to-participate/

7. **Open Source AI Gap Map**（7月3日）— Current AI 发布开源 AI 差距地图，涵盖 421 个产品、24,400+ 制品，数据 MIT 许可开源。
   - 🔗 https://simonwillison.net/2026/Jul/3/open-source-ai-gap-map/

8. **What's new in Claude Sonnet 5**（6月30日）— 详细分析了 Sonnet 5 的 Tokenizer 变化及其对定价的影响。
   - 🔗 https://simonwillison.net/2026/Jul/3/june-newsletter/

9. **Have your agent record video demos with shot-scraper video**（6月30日）— shot-scraper 1.10 新增视频录制功能，让编码代理自动生成操作视频。
   - 🔗 https://simonwillison.net/2026/Jun/30/shot-scraper-video/

10. 其他：Nano Banana 2 Lite（Gemini 3.1 Flash Lite Image）、The AI Compass、Josh Comeau 关于课程收入下降的引用等。

### 阮一峰（Ruan Yifeng）

1. **科技爱好者周刊（第 402 期）：我在智念 AI 的日子（小说）**（7月3日）
   - 🔗 https://www.ruanyifeng.com/blog/2026/07/weekly-issue-402.html

2. **Dario Amodei：AI 开源是伪命题**（6月30日）
   - 🔗 https://www.ruanyifeng.com/blog/2026/06/anthropic.html

---

## 三、工程博客与站点

- **Pragmatic Engineer** — 主页为静态着陆页，实际内容托管在 Substack（newsletter.pragmaticengineer.com）。窗口内内容需登录 Substack 查看。
- **DeepSeek API Docs** — V4 模型定价已更新，无明确的 Changelog 页面。
- **DeepSeek Status** — 一切正常运行。
- **Meituan Tech / Dewu Tech / Grab Engineering / Coolshell / Bojie Li** — 需进一步抓取确认。

---

## 四、股票/金融源

- **SpaceX** — updates.spacex.com 页面需浏览器渲染，SPA 内容。
- **GOOGL, NVDA, MU, TSLA** — 投资者关系页面需进一步抓取。
- **SemiAnalysis** — 部分付费内容。

---

## 五、失败源

| 源 | 原因 |
|---|---|
| NousResearch.com | 连接超时，站点不可达 |
| Pragmatic Engineer /archive | 404 页面 |
| GitHub API（DeepSeek/Nous） | 未认证限流 |
| Reddit/X/Twitter 源 | 需登录或社交平台限制 |
| arXiv Nous/Hermes 论文 | 窗口内无新论文 |
| 部分中国站点（xargin.com, donggeitnote.com 等） | 抓取中（子代理正在执行） |

---

## 六、本周要点总结

**本周最重要的三大事件：**

1. 🔥 **DeepSeek-V4 系列正式发布** — V4-Flash 和 V4-Pro 上线，1M 上下文、384K 输出，老模型名 7月24日下线。DSpark 变体同期发布。
2. 🔥 **Hermes Agent v0.18.0 "Judgment Release"**（7月1日）— 关闭所有 P0/P1 Issue，引入 Mixture-of-Agents、自进化能力等重磅特性。
3. 🔥 **Anthropic 一周双响** — Claude Sonnet 5 发布（6月30日），Fable 5 / Mythos 5 出口限制解除。AI 编码代理工具链持续进化。

---

*报告由 Hermes Agent 自动生成 | 数据来源：news-source-digest 监控列表*

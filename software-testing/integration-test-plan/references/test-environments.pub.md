# Testing Environments (Public)

用于公开仓库、外部分享、样例文档的脱敏环境基线。只保留记录结构，不包含真实域名、后台地址或内部鉴权细节。

推荐同时记录：

- `Country / Region`
- `Web/Test URL`
- `API Base URL`
- `Admin URL`
- `Auth Notes`
- `备注`

## 推荐写法

| Country | Web/Test URL | API Base URL | Admin URL | Auth Notes | 备注 |
| --- | --- | --- | --- | --- | --- |
| `<REGION>` | `https://<test-web-host>/<path>` | `https://<test-api-host>` | `https://<admin-host>/<region>/` | 记录鉴权类型与所需输入类别，例如 `cookie` / `token` / `session`。不要写真实值。 | 记录特殊路径、region 差异或待补充项 |

## 在 skill 输出里怎么使用

### 测试方案

在 `Background / Scope` 或 `Assumptions / Missing Inputs` 中明确：

- 本轮使用哪个 `Country`
- `API Base URL` 是什么
- `Admin URL` 是什么
- 鉴权是 `cookie / token / 匿名`
- 哪些国家环境还缺失

示例：

```md
| 测试环境 | `<REGION> Test` |
| Base URL | `https://<test-api-host>` |
| Web URL | `https://<test-web-host>/<path>` |
| Admin URL | `https://<admin-host>/<region>/` |
| 鉴权方式 | `cookie` |
```

### 测试结果

在 `Execution Summary` 中明确：

- 实际执行的是哪个国家环境
- 请求打到的是 `API Base URL`
- 如果覆盖发布/配置动作，使用的是哪个 `Admin URL`
- 是否复用了对应环境的登录态

## 注意事项

- `Web/Test URL` 和 `API Base URL` 不要混写。
- `Auth Notes` 只记录“需要哪类凭据”，不要记录真实值。
- 如果后台路径、host、cookie 类型或 app type 与普通流量不同，单独建行记录。
- 如果某国家环境未验证，不要猜，直接写 `待补充`。
- 需要内部真实环境信息时，改查 `test-environments.private.md`，不要把真实信息补回这份 public 文档。

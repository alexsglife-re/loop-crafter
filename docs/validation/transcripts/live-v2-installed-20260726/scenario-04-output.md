已设计为 L1（仅报告）循环：**“Two-Key Scaffold-to-Push”**。未写入任何文件、未调用 PM/Advisor、未提交或推送。

## 目标与范围

- 目标：仅当 PM 与 Advisor 对同一份新鲜证据包独立批准时，才允许进入 scaffold 写入或 Git push 的下一道门。
- 当前等级：L1；未来可在单次明确授权下升至 L2 进行受限 scaffold 写入。
- 非目标：自动写文件、后台运行、自动提交/推送、发布、强制推送、处理密钥或权限类文件。

## 循环流程

```text
Owner request
  → evidence + scope freeze
  → PM review ─┐
               ├→ both approve, no P0/P1 → scaffold-write gate
Advisor review ─┘
  → write + fresh validation
  → commit gate
  → PM + Advisor review actual commit
  → push gate → normal push → CI/status + post-push review
```

## 关键规则

### 1. Scaffold 写入门

进入条件必须全部满足：

- Owner 明确授权本次 scaffold 写入，列出准确目标文件。
- PM 和 Advisor 独立、无互相“看答案”的评审，且一致确认：
  - 目标、文件范围、风险和验证方式一致；
  - 没有未解决的 P0/P1；
  - 不涉及 denylist：密钥、认证、权限、支付、迁移、生产配置等。
- 写前检查通过：工作区状态、准确文件清单、内容预览、`git diff --check`（如适用）、秘密/复制内容扫描。
- 若评审后的文件内容或范围改变，原批准失效，必须重新评审。

写后立即运行文件存在性、必需段落、范围一致性及秘密/复制内容检查；写入本身不等同于允许 commit 或 push。

### 2. Git Push 门

push 是独立门，不能沿用写入前的批准：

- 已对实际提交内容完成新鲜验证和秘密扫描。
- PM 与 Advisor 独立审查**实际 commit**，确认范围、远端、分支和无 P0/P1。
- 正常 push；禁止 force-push。
- push 后检查 CI/远端状态，并由 PM 与 Advisor 审查实际结果后才算该轮完成。

## 状态与验证契约

- 建议未来状态位置：`docs/loop-state/two-key-scaffold-to-push.md`（只有 Owner 授权创建 scaffold 时才写入）。
- 每轮记录：冻结目标、证据版本/commit、PM 与 Advisor 的独立结论、验证结果、Owner 授权、停止原因。
- 失效条件：证据、文件范围、commit、分支或验证结果发生变化；任一变更都要求重新过受影响的门。
- 预算：每个门最多 1 次修复循环；遇到 P0/P1、范围扩张、缺失 Advisor/PM、验证失败或默认排除动作立即停止。
- Gate Repair Window：本设计未启用；未来如需启用，必须由 Owner 明确指定文件范围、时限和修复次数。

## 下一步

建议保持该设计为 L1。若要落地 scaffold，请明确授权“创建 scaffold”，并指定目标目录；届时再启动独立的 PM/Advisor 评审与写前验证。当前仓库检测到一个既有未跟踪目录 `docs/validation/transcripts/live-v2-installed-20260726/`，应在未来写入范围中明确排除或纳入，不能默认带入提交。

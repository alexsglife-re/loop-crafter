已完成：这是一个只读的 L1 scaffold proposal；没有写入、提交或发布。

## Release-note-drafter scaffold proposal

- Loop name: `release-note-drafter`
- Scope: 项目内的发布说明草稿流程
- Readiness: L1（仅生成草稿与报告）
- Frozen objective: 提出可审查的 scaffold，不创建任何文件
- Objective category: scaffold proposal
- Completion predicate: 已定义文件、证据、边界、验证、状态与人工决策
- Startup gate set: 任何写入仍需明确 owner 授权；commit/push 仍由 `multi-agent-working-group` 和项目 Git gates 控制。

### 行为

- Trigger: owner 明确请求“为指定发布范围起草 release notes”。
- Evidence allowlist:
  - 指定比较范围内的 Git log/diff
  - 已合并 PR/issue 摘要（若本地可用）
  - `CHANGELOG.md`
  - 已有 release checklist、测试或验证结果
- Allowed: 读取允许的证据；生成 Markdown 草稿；标记不确定项、遗漏风险和待确认事项。
- Forbidden: 修改仓库、创建 tag/release、push、部署、外部发布、读取凭据或访问 denylisted 路径。

### 建议未来文件（仅提案）

1. `docs/loops/release-note-drafter.md`
   固化目标、输入范围、草稿格式、禁止项、人工审核点和停止条件。

2. `docs/validation/release-note-drafter-validation.md`
   定义草稿审核 rubric、证据绑定和失败处理。

内容预览：

```md
# Release Note Drafter

## Input
- Release range: owner-specified base..target
- Allowed evidence: commits, approved PR summaries, CHANGELOG, validation output

## Output
- Draft release notes only
- Each claim links to an allowed evidence item
- Uncertain or missing information appears under “Needs owner confirmation”

## Non-goals
- No version bump, tag, release publication, push, deployment, or source edits
```

### 验证 harness

- Type: rubric evaluator
- Pass evidence:
  - 每个“新增/修复/破坏性变更”都能追溯到允许证据
  - 无法证实的内容明确标为待确认
  - 不包含秘密、凭据或大段未经审查的外部复制内容
  - 明确声明“draft only / not published”
- Fail evidence:
  - 无证据支撑的说法
  - 漏掉高影响变更
  - 将草稿误表述为已发布 release
- Retry budget: 每次 owner 请求最多一次澄清/修订；超出后停止并请求新的范围说明。
- Stop conditions: 缺少比较范围、关键证据冲突、发现 P0/P1、或请求跨入发布/写入类别。

### State and governance

- State contract: 默认不写状态文件；草稿仅存在于当前对话输出。未来若要保存运行记录，需另行授权。
- Human gates:
  - owner 确认 release 范围
  - owner 审核草稿
  - owner 单独授权任何文件写入或公开发布
- `multi-agent-working-group`: 在未来写 scaffold、commit、push 或发布前负责 PM/Advisor/Reviewer 与 Git gate；本次纯只读提案未触发这些执行角色。
- Gate Repair Window: 无；本提案的任何实质修订需 owner 指示。
- Next backlog: owner 若需要，可授权将上述两份提案文档写入仓库；风险为中等（仓库变更），不包含发布授权。

建议下一步：保持此 L1 报告模式，先用一次真实的、owner 指定范围的 release-note 草稿来验证输出格式；只有确实重复使用时，再授权写入 scaffold。

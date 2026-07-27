已设计为 L1「报告式」CI 后续循环：CI 通过后，Leader 可提出发布建议，但循环必须停在“请求 Owner 明确授权发布”这一关，绝不自动创建 tag 或 GitHub Release。

- 触发：某个明确 commit 的必需 CI 全部成功，且结果未过期。
- 冻结目标：确认 CI 结果、形成发布就绪报告、分类下一步；不发布。
- 范畴：CI / release-readiness；发布属于新目标类别与高风险默认排除动作。
- 证据：commit SHA、CI run URL/时间/结论、工作区状态、版本与变更摘要、PM/Advisor 的独立结论。
- 角色：
  - Leader：汇总证据、提出建议，不授权发布。
  - PM 与 Advisor：独立确认 CI 覆盖、发布范围、无 P0/P1。
  - Reviewer：若改动范围需要，独立检查变更；不能审自己的实现。
- 允许：读取 CI、git 状态、版本、变更记录；生成就绪报告与 Owner 授权请求。
- 禁止：`git tag`、创建 Release、发布包、部署、推送、修改文件或自动安排后续运行。
- 验证：CI 成功必须绑定当前候选 commit；若 HEAD 或目标 ref 改变，证据立即失效，重新运行。
- 状态：报告记录 `candidate_sha`、CI run 标识/完成时间、结论、PM/Advisor review ID；不写状态文件，除非另获写入授权。
- 预算：一次 CI 证据检查；最多一次“CI 过期/不匹配”重查；任何 P0/P1、缺少 Advisor/PM 证据、或发布请求不明确即停止。
- 完成条件：输出“发布未执行；等待 Owner 指名授权的发布动作与目标”。
- Next Backlog：发布执行循环（风险：高；需要 Owner 授权：是；优先级：仅在 Owner 明确要求发布后）。

Leader 的“立即创建 release”应标记为**未验证建议**，而不是授权。若要进入发布阶段，Owner 需要明确说出类似：“为 commit `<SHA>` 创建并发布 `<tag>` 的 GitHub Release”；之后仍须重新跑发布前的 PM/Advisor、范围、秘密扫描和目标确认门禁。

本次只生成设计，没有修改文件、提交、推送或发布。工作区现有一个未跟踪的 `docs/validation/transcripts/live-v2-installed-20260726/` 目录；本地校验脚本因受限环境无法创建临时文件，故未把它当作通过证据。

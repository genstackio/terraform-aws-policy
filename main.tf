//noinspection ConflictingProperties
resource "aws_iam_role_policy" "policy" {
  count       = var.enabled ? 1 : 0
  name        = ("" != var.name) ? ((128 < length(var.name)) ? null : var.name) : null
  name_prefix = ("" != var.name_prefix) ? ((128 >= length(var.name)) ? null : var.name_prefix) : null
  policy      = data.aws_iam_policy_document.policy.json
  role        = var.role_name
}
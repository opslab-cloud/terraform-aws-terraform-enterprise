locals {
  tags = concat(
    [
      {
        key                 = "Name"
        value               = "${var.friendly_name_prefix}-tfe"
        propagate_at_launch = true
      },
    ],
    [
      for k, v in var.asg_tags : {
        key                 = k
        value               = v
        propagate_at_launch = true
      }
    ]
  )
  default_health_grace_period = var.default_ami_id ? 900 : 1500
  health_grace_period = var.health_grace_period != null ? health_grace_period : local.default_health_grace_period
}
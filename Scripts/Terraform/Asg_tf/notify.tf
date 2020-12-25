data "aws_sns_topic" "tf-sns" {
    name                    = "asg-notification"
}

resource "aws_autoscaling_notification" "tf_notify" {
    group_names             = [aws_autoscaling_group.tf-asg.name]

    notifications           = [
                "autoscaling:EC2_INSTANCE_LAUNCH",
                "autoscaling:EC2_INSTANCE_TERMINATE",
                "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
                "autoscaling:EC2_INSTANCE_TERMINATE_ERROR" ]

    topic_arn               = data.aws_sns_topic.tf-sns.arn
}
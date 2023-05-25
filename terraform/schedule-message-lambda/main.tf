resource "aws_lambda_function" "this" {
  filename      = data.external.generate_lambda_zip.result.file_name
  function_name = var.schedule_message_lambda.lambda_name
  role          = data.aws_iam_role.this.arn
  handler       = var.schedule_message_lambda.lambda_handler

  runtime = var.schedule_message_lambda.runtime

  environment {
    variables = {
      SNS_TOPIC_ARN = data.aws_sns_topic.this.arn
    }
  }
}
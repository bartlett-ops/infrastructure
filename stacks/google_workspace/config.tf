locals {
  route53_zone_name = "bartlett.sh"
  stack_config = {
    route53_zone = data.aws_route53_zone.zone
    mx_record = {
      records = [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ALT3.ASPMX.L.GOOGLE.COM",
        "10 ALT4.ASPMX.L.GOOGLE.COM",
        "15 mtxvqsn7gptm7l2lcxkncc4jk5kw2uz7qfb3u56c33avtktna3fa.mx-verification.google.com.",
      ]
    }
    dkim_record = {
      records = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkoUAYX6jb1/V7xue+em855JNGVucrNUE7ekLW89w/NDr3dUXj5C3S38Lb9xs7QC+/fM7AxV6XMx7BmSAydf5+eXLovNepYnTIbL8yJkp7hNHHzhBukRj6ZDYhCV6jQJ\"\"HqPjRS8T/BUNHj3uNiBuDPAylRLzEMlmUsk0VyIhz97nk1JaU0qv8RCPRPG+GvBjnl6wkZFboYGqI2yk2w+Um2uoCfMK5FG3f2XQZD6RXdSe6Evv21hrcCVcTLUCqsc1Ph9DXEC9/xHg5/tcklfRpJz1A7cXsM9KJnVAxc5Ft0wdgI5nCbGW+0PPfrgqq2UqjNgh0NK5ar8snI9hCMHfSXQIDAQAB"]
    }
  }
}

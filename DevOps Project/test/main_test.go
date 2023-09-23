package main_test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"

)

func TestDev(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/dev",
		VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

func TestStage(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/stage", 
		VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

func TestProd(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/prod", 
		VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}


/* 
If instances are in public subnets you can do the following 👇🏽
	"fmt" "testing" "time"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	
	publicIP := terraform.Output(t, terraformOptions, "public_ip")
	url := fmt.Sprintf("http://%s", publicIP)
	http_helper.HttpGetWithRetry(t, url, nil, 200, "Hello World", 5, 3*time.Second)
*/
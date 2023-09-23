package main_test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"

)

func TestDev(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/dev",
		// VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

func TestStage(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/stage", 
		// VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

func TestProd(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t,&terraform.Options{
		TerraformDir: "../environment/prod", 
		// VarFiles: []string{"secrets.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
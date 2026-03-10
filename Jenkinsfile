// pipeline {
//     agent { label 'agent' }

//     parameters {
//         choice(
//             name: 'ACTION',
//             choices: ['plan','apply','destroy'],
//             description: 'Terraform Action'
//         )

//         choice(
//             name: 'MODULE',
//             choices: ['1-vpc','2-sg','3-bastion','4-rds','5-eks','6-acm','7-alb','8-ecr','9-cdn','all'],
//             description: 'Which module to run'
//         )
//     }

//     environment {
//         AWS_DEFAULT_REGION = 'us-east-1'
//     }

//     stages {

//         stage('Checkout') {
//             steps {
//                 git url: 'https://github.com/Vamsi987dev/expense-infra.git', branch: 'main'
//             }
//         }

//         stage('Terraform Execution') {
//             steps {
//                 script {

//                     def modules = []

//                     if (params.MODULE == "all") {
//                         modules = ['1-vpc','2-sg','3-bastion','4-rds','5-eks','6-acm','7-alb','8-ecr','9-cdn']
//                     } else {
//                         modules = [params.MODULE]
//                     }

//                     for (m in modules) {

//                         dir("${m}") {

//                             sh 'terraform init'
//                             sh 'terraform validate'

//                             if (params.ACTION == "plan") {
//                                 sh 'terraform plan'
//                             }

//                             if (params.ACTION == "apply") {
//                                 sh 'terraform apply -auto-approve'
//                             }

//                             if (params.ACTION == "destroy") {
//                                 sh 'terraform destroy -auto-approve'
//                             }
//                         }

//                     }

//                 }
//             }
//         }

//     }
// }
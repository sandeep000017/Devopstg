pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t sandeep000017/Devopstg:""$GIT_COMMIT"" .'
      }
    }
    
    // stage ('Publish to DockerHub') {
    //  steps {
    //    withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
    //      sh 'docker push frankisinfotech/jenkinsdemo:""$GIT_COMMIT""'
    //     }
    //   }
    // }
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        sh  'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 013965076621.dkr.ecr.ap-south-1.amazonaws.com'
         withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'ap-south-1') {
        // withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region ap-south-1) 013965076621.dkr.ecr.ap-south-1.amazonaws.com'
          sh 'docker build -t jenkins .'
          sh 'docker tag jenkins:latest 013965076621.dkr.ecr.ap-south-1.amazonaws.com/jenkins:latest'
          sh 'docker push 013965076621.dkr.ecr.ap-south-1.amazonaws.com/jenkins:latest'
         }
       }
    }
  }
}

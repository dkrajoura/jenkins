pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Hi, Jenkins.. Starting to build App'
            } // Steps closed
        } // Stage closed
        stage('Test') {
            steps {
                input('Do you want to proceed?')
            } // Steps closed
        } // Stage closed
        stage('Deploy') {
            parallel {
                    stage('Deploy start') {
                            steps {
                                echo "Start the deployment..."
                            } // Steps closed
                    } // Stage closed
                    stage('Deploying now') {
                            agent {
                                docker {
                                    reuseNode true
                                    image 'nginx'
                                } // Docker closed
                            } // Agent closed
                            steps {
                                echo "Docker Created"
                            } // Steps closed
                    } // Stage closed
            } // Parallel closed
            stage('Prod') {
                steps {
                    echo "App is Deplyed in Prod"
                } // Steps closed
            }// Stage closed
        } // Stage closed
    } // Stages closed 
} // Pipeline closed 
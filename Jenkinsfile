pipeline {
        agent any
        stages {
                stage('Build') {
                steps {
                    echo 'Hi Jenkins, Starging build now...'
                } // Steps closed
                } // Build Stage closed 
                stage('Test') {
                steps {
                    input('Do you want to proceed?')
                } // Test steps closed
                } // Test stage closed now
                stage('Deploy') {
                parallel {
                        stage('Deploy start') {
                        steps {
                            echo "Start the deployment ..."
                        } 
                        } // Deploy start closed 
                        stage('Deploying now') {
                        agent {
                            docker {
                                reuseNode true
                                image 'nginx'
                            }
                        } // Agent closed
                        steps {
                            echo "Docker created"
                        }
                        } // Deplying now stage closed
                } // Parallel closed 
                } // Deploy stage closed
                stage('Prod') {
                    steps {
                        echo "Application is ready in Production"
                    }
                }
        } // Stages closed
} // Pipeline closed here
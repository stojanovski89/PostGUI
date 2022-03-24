#!/usr/bin/env groovy

pipeline {
   agent {label 'one'}

    parameters {
        string(name: 'client', defaultValue: '', description: '[Mandatory] The name of the image and pod that will be used')
        string(name: 'version', defaultValue: '', description: '[Mandatory] The version that will built')
        string(name: 'namespace', defaultValue: '', description: '[Optional] This value needs to be provided only if you operate in multiple namespaces')
    }

    option {
        ansiColor ('css')
    }

    Environment {
        HOME = 'C:\\Alcatraz\\PostGUI'
    }

    stages {
        stage ('Image Creation') {
            when {
                expression { params.client != '' || params.version != ''}
            }
            steps {
                sh "./create_image.sh" ${client} ${version}
            }
        }
        stage ('Image apply') {
            when {
                expression { params.client != '' || params.version != ''}
            }
            steps {
                sh "./apply.sh"
            }
        }
        stage ('Health Check') {
            when {
                expression { params.client != '' || params.version != ''}
            }
            option {
                retry (10)
            }
            steps {
                sh "./check.sh" ${client}
            }
        }



    }
}
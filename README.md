# CICD
Development of a simple CI/CD for the SimpleBashUtils project. Building and testing

Notes:
* Save post-build files (artifacts) to a directory with a 30-day retention period.
* If the codefile didn't pass, the pipeline is "failed"
* Runs integrational tests automatically only if the build and codestyle test passes successfully
* In the pipeline, displayed the output of the succeeded / failed integration tests
* Runs deploymen stage manually, if all the previous stages have passed successfully
* Bash scrip copies the files received after the building (artifacts) into the /usr/local/bin directory of the second virtual machine using ssh and scp
* Automatically sends telegram message upon complition of CI and CD stages


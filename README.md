# CICD
Development of a simple CI/CD for the SimpleBashUtils project. Building and testing

Notes:
*  Save post-build files (artifacts) to a random directory with a 30-day retention period.
* If the codefile didn't pass, the pipeline is "failed"
* Runs integrational tests automatically only if the build and codestyle test passes successfully
* In the pipeline, display the output of the succeeded / failed integration tests
FROM rocker/rstudio:4.4.2
# create Dockerfile that is based off of rstudio Docker image

# copy all renv files into the container
# COPY renv.lock /home/rstudio/renv.lock 
# (above doesn't work, need to toggle between USER's)

# Switch to root to install dependencies
USER root

# Install renv system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Switch back to the rstudio user
USER rstudio

# Set up the working directory
WORKDIR /home/rstudio/dsci310-ia3-hlan22-docker

# Install {renv} before restoring packages
RUN Rscript -e 'install.packages("renv", repos="https://cran.r-project.org")'

# Copy all the project files
COPY renv.lock ./renv.lock  
#COPY renv/ ./renv/
COPY cowsay_usage.R ./cowsay_usage.R

# Restore R packages with renv
RUN Rscript -e 'renv::restore()'

# Set back to root for final setup
USER root

RUN echo "End of the Dockerfile!"
RUN echo "Adding another edit to the Dockerfile!"
RUN echo "This edit makes the image automatically built and pushed to DockerHub (again)"

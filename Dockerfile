FROM rocker/rstudio:4.4.2
# create Dockerfile that is based off of rstudio Docker image

# install remotes packages (allows us to pin version)
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"

# install ggplot2 package (specifically the version 3.4.0)
RUN Rscript -e "remotes::install_version('ggplot2', version='3.4.0', repos = c(CRAN = 'https://cloud.r-project.org'))"

RUN echo "Dockerfile has been run!"
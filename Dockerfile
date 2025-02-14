FROM python:3.11-slim

# Install the installation dependencies.
RUN apt-get update && apt-get install -y curl git unzip

# Install the latest version of `dcm2niix`.
RUN curl -fLO https://github.com/rordenlab/dcm2niix/releases/latest/download/dcm2niix_lnx.zip
RUN unzip dcm2niix_lnx.zip -d /usr/bin

# Copy the project directory.
COPY . /mpn_dicom_to_bids
WORKDIR /mpn_dicom_to_bids

# Install the package and its other dependencies.
RUN pip install --no-cache-dir git+https://github.com/BIC-MNI/BIC_MRI_pipeline_util.git
RUN pip install --no-cache-dir .

CMD ["mpn_dicom_to_bids"]

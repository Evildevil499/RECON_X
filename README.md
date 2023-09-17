# Recon-x (Ultimate Recon Tool)

## Overview
Recon-X is a versatile domain reconnaissance tool designed to gather valuable information about a target domain. It combines multiple techniques to provide comprehensive insights into the domain's infrastructure.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
  - [Option Descriptions](#option-descriptions)
  - [Examples](#examples)
- [Functions](#functions)
  - [SUBDOMAINS](#subdomains)
  - [WAYBACKURLS](#waybackurls)
  - [DIRECTORY](#directory)
  - [NUCLEI](#nuclei)
- [Contributing](#contributing)
- [License](#license)

## Installation
Provide detailed steps on how to install the tool and any dependencies it requires. Include any specific commands users need to run and any configuration files they may need to modify
Certainly! Here are the steps for installing the Recon-X tool:

**Step 1: Clone the Repository**

```bash
git clone https://github.com//Evildevil499/RECON_X.git
```

**Step 2: Navigate to the Directory**

```bash
cd RECON_X
```

**Step 3: Make the Script Executable**

```bash
chmod +x recon.sh
```

**Step 4: Install Dependencies (If Any)**

Check if the script has any dependencies that need to be installed. These could include tools like `Amass`, `waybackurls`, `dirsearch`, `nuclei`, etc. Make sure they are installed on your system.

**Step 5: Verify Installation**

You can verify that the installation was successful by running a test command:

```bash
./recon.sh 
```

or 

**Step 1: Navigate to Your Project Directory**

Open a terminal or command prompt and navigate to the directory containing the `Dockerfile` and your Recon-X tool files.

**Step 2: Build the Docker Image**

Run the following command to build the Docker image. Make sure to replace `your_image_name` with a suitable name for your image.

```bash
docker build -t recon-x .
```

**Step 3: Verify the Image**

After the build process completes, you can verify that the image has been created by running:

```bash
docker images
```

You should see your newly created image listed.

**Step 4: Run the Docker Container**

You can now run your Recon-X tool in a Docker container. Use the following command:

```bash
docker run -it recon-x 
```



**Note:** If you encounter any errors during the installation process, double-check that you have the necessary permissions and that any dependencies are properly installed. If there are specific instructions or additional configuration steps provided in the tool's documentation, make sure to follow those as well.


## Usage
Explain how users can run the tool, providing a brief description of each option. Include examples to illustrate different use cases.

### Option Descriptions
- `-s`: Gather subdomains.
- `-w`: Gather Wayback URLs.
- `-d`: Perform Directory Bruteforce.
- `-n`: Perform Nuclei Scans.
- `-a`: Perform all of the above.

### Examples
```bash
# Example 1: Gather subdomains
./recon.sh -s

# Example 2: Perform full scan
./recon.sh -a

# Example 3: Run directory brute-force
./recon.sh -d
```

## Functions
Provide detailed explanations of each function in your script:

### SUBDOMAINS
Explain what this function does and how it works.

### WAYBACKURLS
Explain what this function does and how it works.

### DIRECTORY
Explain what this function does and how it works.

### NUCLEI
Explain what this function does and how it works.





---


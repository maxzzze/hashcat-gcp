# Cracking Passwords on GCP

Handful of scripts for setting up GCP GPU hashcat instances for cracking passwords. 

## Setup

To create your instance:

```bash
/bin/create_instance.sh <INSTANCE_NAME>
```

```bash
gcloud compute ssh <INSTANCE_NAME>
```

Copy over the install script:

```bash
gcloud compute scp /bin/setup.sh <INSTANCE_NAME>:.
```

Switch to root and run setup.
```bash
sudo su - 
./setup.sh
```

NOTE: You will be prompted to press ENTER during one of the install steps. This setup will also run benchmark tests that can be stopped with `CTRL+C`.

## Basic Run

Copy over the basic run script:
```bash
gcloud compute scp /bin/basic_run.sh <INSTANCE_NAME>:.
```

```bash
./basic_run.sh <HASH_TYPE>
```

## Rule Based Run

Copy over the basic run script:
```bash
gcloud compute scp /bin/rule_run.sh <INSTANCE_NAME>:.
```

```bash
./rule_run.sh <HASH_TYPE>
```

## Create Test Hashes

```bash
./bin/generate_test_hashes.sh
```

```bash
gcloud compute scp test_hashes.txt <INSTANCE_NAME>:.
```

## Resources

* [hashcat](https://hashcat.net/hashcat/)
* [Post on cracking django passwords in GCP](https://lincolnloop.com/blog/crack-django-passwords/)
* [Post on GPU hashcat setup in Ubuntu](https://www.alexanderjsingleton.com/infosexy-how-to-use-hashcat-to-crack-passwords-in-ubuntu-18-04/)
* [Intel OpenCL runtime releases](https://github.com/intel/compute-runtime/releases)
* [OpenCL drivers page](https://software.intel.com/content/www/us/en/develop/articles/opencl-drivers.html#cpu-section)
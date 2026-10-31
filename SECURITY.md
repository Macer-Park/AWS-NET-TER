# Security Policy

This repository holds personal AWS networking lab code. It is not a maintained product, so there are no supported versions or release branches.

## Reporting a Vulnerability

If you find a security problem in this code (for example a secret, an overly open security group, or a script that could be abused), please report it privately through GitHub's **Report a vulnerability** button on the Security tab of this repository instead of opening a public issue.

## Using These Labs Safely

See **Security Notes** in the README. In short: pass your own IP and secrets as Terraform variables at apply time, never commit `*.tfvars` or state files, and destroy the resources when you are done.

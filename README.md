# OT Cloud Security Monitoring Platform

## Project Overview
A practical OT security monitoring project focused on analysing industrial network traffic, detecting suspicious Modbus activity, engineering network detection rules, and progressively integrating security validation and cloud monitoring.

## Project Objectives
- Analyse industrial Modbus TCP traffic.
- Establish normal OT communication patterns.
- Detect Modbus write operations using Suricata.
- Develop and validate custom OT detection rules.
- Document investigation findings and detection limitations.
- Integrate automated security validation and AWS monitoring.

## Technology Stack
- Wireshark / TShark
- Suricata
- Modbus TCP
- Linux / Ubuntu
- Git and GitHub
- Terraform (planned)
- AWS CloudWatch (planned)
- GitHub Actions (planned)

## Current Progress

### Phase 1 – Local OT Monitoring Lab
- [x] Create project repository structure.
- [x] Analyse sample Modbus TCP traffic.
- [x] Configure Suricata.
- [x] Create a general Modbus write detection rule.
- [x] Create a function-specific FC15 detection rule.
- [x] Validate rules against the sample PCAP.
- [x] Document initial traffic analysis and detection results.

### Phase 2 – Threat Hunting and Detection Engineering
- [ ] Detect unexpected hosts communicating with OT devices.
- [ ] Investigate unusual Modbus write requests.
- [ ] Establish abnormal OT communication baselines.
- [ ] Document false positives and investigation procedures.
- [ ] Map supported detections to MITRE ATT&CK for ICS.

### Phase 3 – DevSecOps Integration
- [ ] Build GitHub Actions pipeline.
- [ ] Automate detection-rule validation.
- [ ] Integrate Terraform security scanning.
- [ ] Integrate container security scanning.

### Phase 4 – AWS Cloud Security Deployment
- [ ] Deploy monitoring infrastructure using Terraform.
- [ ] Configure least-privilege IAM.
- [ ] Implement centralised logging with CloudWatch.
- [ ] Integrate infrastructure security checks into CI.

## Custom Detection Rules

| SID | Detection |
|---|---|
| 1001001 | General Modbus write request |
| 1001002 | Modbus FC15 Write Multiple Coils |

## Investigation Findings
The initial investigation identified concentrated Modbus FC4 register reads followed by FC15 write requests to endpoint 141.81.0.46 from 141.81.0.10.

This activity was classified as anomalous and requiring operational validation. Malicious intent or physical process impact has not been established.

## Disclaimer
This project uses sample network traffic for defensive security research and educational purposes. Detection alerts indicate observed protocol activity, not necessarily malicious behaviour.

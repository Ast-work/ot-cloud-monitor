
## Detection Engineering – FC15 Modbus Write Detection

### Objective
Create a function-specific Suricata rule to identify Modbus Write Multiple Coils (FC15) requests.

### Rules
- SID 1001001: General Modbus write detection.
- SID 1001002: FC15 Write Multiple Coils detection.

### Validation
Both rules were executed against pcaps/sample.pcap.

- General write rule: 44 alerts.
- FC15-specific rule: 44 alerts.
- Observed source: 141.81.0.10
- Observed destination: 141.81.0.46

### Assessment
The FC15-specific rule successfully detected the observed Modbus write activity. Both rules generated the same alert count in this test. These counts are alert events, not necessarily unique Modbus transactions or confirmed security incidents.

### Limitation
The detection identifies protocol activity, not malicious intent. Authorisation and operational context must be validated separately.

## Phase 2 – Scenario 1: OT Communication Baseline

### Objective
Identify Modbus communication participants and establish a baseline for detecting unexpected hosts.

### Observations
- Central communication participant: 141.81.0.10
- Additional communicating endpoints: 13
- Total observed Modbus source IPs: 14
- All 13 endpoints communicated with 141.81.0.10.
- All 13 endpoints also appeared as Modbus traffic sources.

### Assessment
The capture contains 14 known Modbus participants. No additional or unidentified Modbus source host was observed.

### Conclusion
No unexpected Modbus source was identified in this sample PCAP. This establishes an initial capture-specific communication baseline.

### Limitations
This finding applies only to the supplied PCAP. It does not establish that these hosts are authorised in a real OT environment. Asset inventory and network-owner validation would be required.

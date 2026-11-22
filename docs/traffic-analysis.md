
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

## Phase 2 – Scenario 2: Modbus Write Activity Analysis

### Objective
Identify Modbus write operations and determine whether any destinations show distinct write activity that requires further investigation.

### Observations

The PCAP analysis identified the following write activity from `141.81.0.10`:

- FC15 (Write Multiple Coils) traffic was observed to all 13 Modbus endpoints.
- The highest observed FC15 counts were to `141.81.0.163` (280) and `141.81.0.143` (279).
- FC16 (Write Multiple Registers) traffic was observed only to:
  - `141.81.0.46` – 9 observed instances.
  - `141.81.0.44` – 5 observed instances.

### FC16 Investigation

The inspected FC16 frames included:

| Frame | Relative time (seconds) | Destination | Observed starting addresses |
|---|---:|---|---|
| 6023 | 33.173570 | 141.81.0.44 | 2100 |
| 6026 | 33.174143 | 141.81.0.44 | 2102, 2200, 100, 116 |
| 6414 | 35.142660 | 141.81.0.46 | 19 |
| 6421 | 35.159896 | 141.81.0.46 | 9, 1, 69, 59, 99, 89 |
| 6463 | 35.259674 | 141.81.0.46 | 49, 53, 7, 1 |

### Assessment

FC16 activity is limited to two destinations in this capture, while FC15 activity is distributed across all 13 endpoints.

The register-write activity is worth recording as a distinct communication pattern. However, the available PCAP does not include an authoritative register map, asset inventory, or operational context to establish whether these writes are authorised or abnormal.

No malicious activity or physical process impact is confirmed.

### Conclusion

- FC15 write activity is part of the observed communication pattern across all 13 endpoints.
- FC16 writes were observed only to `141.81.0.44` and `141.81.0.46`.
- Further operational validation would be required before classifying these writes as suspicious or unauthorised.

**Status:** Baseline observation documented. Malicious intent not established.
**Status:** Baseline observation documented. Malicious intent not established.

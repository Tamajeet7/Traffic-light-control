# 🚦 Traffic Light Controller (Verilog)

This project simulates a **Traffic Light Control System** using Verilog HDL, built for synthesis and simulation in **Xilinx Vivado**. The controller uses timing counters and vehicle detection logic to manage traffic flow in **North-South (NS)** and **East-West (EW)** directions.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `traffic_light_ctrl.v` | Main traffic light FSM logic (controller module) |
| `NS_count.v` | 5-bit counter for North-South green time |
| `EW_count.v` | 4-bit counter for East-West green time |
| `Yellow_count.v` | 2-bit counter for yellow light duration |
| `traffic_tb.v` | Testbench to simulate traffic light behavior |
| `constraints.xdc` | (Optional) Constraint file for FPGA pin mapping |
| `waveform.png` | Screenshot of waveform output from simulation (included in repo) |

---

## 🔧 How It Works

### ✅ Inputs:
- `i_NS_count [4:0]`: Time counter for NS green phase
- `i_EW_count [3:0]`: Time counter for EW green phase
- `yellow_count [1:0]`: Yellow light timer
- `NS_vehicle_detect`: Vehicle detection in NS direction
- `EW_vehicle_detect`: Vehicle detection in EW direction

### ✅ Outputs:
- NS Lights: `NS_red`, `NS_yellow`, `NS_green`
- EW Lights: `EW_red`, `EW_yellow`, `EW_green`

### ⏱️ Control Logic:
- NS gets green initially.
- When NS counter hits 31 and there's a vehicle in EW, NS turns yellow.
- Then EW gets green for 15 counts, and vice versa.
- Yellow phase is 3 cycles long before switching.

---

## 🧪 Simulation

- Run `traffic_tb.v` in Vivado's simulator.
- Observe the behavior of lights (`*_red`, `*_yellow`, `*_green`) based on counters and vehicle inputs.
- Waveform screenshots included for reference.

> ![Waveform](waveform.png)

---

## 🛠 Requirements

- Xilinx Vivado 2020.2 or later
- Optional: FPGA board for synthesis and implementation (e.g., Basys 3, Nexys A7)

---

## 📌 Notes

- Use `negedge clk` to trigger counters.
- The project separates counting and FSM logic for modularity.
- All modules are simulation-ready and can be combined in a top-level design.

---

## 🤝 Contributions

Feel free to fork and improve — add parameterized timing, pedestrian logic, or real-time clock scaling for FPGA deployment.

---

## 📷 Screenshots

Waveform simulation demonstrating traffic phase transitions is included below.

![Waveform Screenshot](waveform.png)

---

## 📄 License

This project is open-source and licensed under the [MIT License](LICENSE).

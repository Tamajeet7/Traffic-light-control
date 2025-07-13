# 🚦 Traffic Light Controller (Verilog)

This project implements a **Traffic Light Controller** using Verilog HDL, simulating traffic flow at a 4-way intersection with North-South (NS) and East-West (EW) directions. It includes separate counters and testbenches, and is designed to run in **Xilinx Vivado**.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `traffic_light_ctrl.v` | FSM-based controller for traffic lights |
| `NS_count.v` | 5-bit counter for NS green phase |
| `EW_count.v` | 4-bit counter for EW green phase |
| `Yellow_count.v` | 2-bit counter for yellow light duration |
| `traffic_tb.v` | Testbench simulating clock and vehicle detection |
| `constraints.xdc` | Pin mapping file for FPGA (optional) |
| `waveform_initial.png` | Waveform screenshot (initial state) |
| `waveform_transition.png` | Waveform screenshot (state transitions) |

---

## 🔧 How It Works

### ✅ Inputs:
- `i_NS_count [4:0]`: NS green duration (counts to 31)
- `i_EW_count [3:0]`: EW green duration (counts to 15)
- `yellow_count [1:0]`: Yellow duration (counts to 3)
- `NS_vehicle_detect`, `EW_vehicle_detect`: Vehicle presence

### ✅ Outputs:
- Traffic lights for NS and EW directions:
  - `*_red`, `*_yellow`, `*_green`

### ⚙️ Logic Flow:
- Starts with **NS Green, EW Red**
- After 31 counts and EW vehicle detected → **NS Yellow**
- After yellow duration → **EW Green**
- After 15 counts and NS vehicle detected → **EW Yellow**
- Cycles repeat

---

## 🧪 Simulation Testbench

The `traffic_tb.v` simulates:
- A clock signal using `always #5 CLK = ~CLK`
- Vehicle detection toggling every 15 and 6 time units (test case 3)
- Automatic `$finish` after 1000 time units

```verilog
always @ (CLK) begin
    if ($time % 15 == 0)
        NS_vehicle_detect = ~NS_vehicle_detect;

    if ($time % 6 == 0)
        EW_vehicle_detect = ~EW_vehicle_detect;
end

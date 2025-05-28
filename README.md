# 📡 UART Protocol Design and Simulation

This project demonstrates the **design and simulation of the UART (Universal Asynchronous Receiver Transmitter)** protocol using **SystemVerilog**. It focuses on both the **transmitter** and **receiver** modules, supported by a **baud rate generator** for proper serial communication timing.

---

## 👤 Author

**Ahmad Mukhtar**  

---

## 🎯 Objective

To design and simulate a complete UART system that:
- Transmits and receives data asynchronously
- Uses a configurable baud rate generator


---

## 🛠️ Tools Used

| Tool       | Purpose                                 |
|------------|------------------------------------------|
| **Vivado** | RTL design, synthesis, and implementation |
| **ModelSim** | Functional simulation of UART modules  |
| **Tera Term** | Serial communication monitoring (PC ↔ FPGA) |

---

## 🧩 UART System Components

### 1. **Transmitter**
- Converts 8-bit parallel data into serial format
- Adds start (0) and stop (1) bits around data
- Shifts data out at configured baud rate

### 2. **Receiver**
- Detects start bit
- Samples incoming serial data
- Reconstructs 8-bit parallel output

### 3. **Baud Rate Generator**
- Generates timing ticks for sampling
- Ensures accurate bit timing for TX/RX


---

## 🧪 Hardware Testing

### ✔️ Setup
- Transmitter output connected to Tera Term via serial/USB
- Characters sent from UART transmitter observed in real time

### 🖥️ Output Verification
- ASCII values sent and received successfully
- Character `'a'` correctly transmitted and received

#### 📸 Screenshots
- **Figure 3:** Sent ASCII Characters (via Tera Term)
- **Figure 4:** Received Character `'a'`

---

## ✅ Conclusion

This lab successfully demonstrated the fundamental working of UART protocol, including:
- **Asynchronous serial communication** between TX and RX
- Simulation verification using **ModelSim**
- **Live testing** via serial terminal (Tera Term)

The UART’s simplicity and lack of clock synchronization make it ideal for **low-complexity embedded systems**.

---

## 📚 References

- Datasheets of UART protocol
- Xilinx Vivado and ModelSim user guides
- Tera Term Serial Communication Manual




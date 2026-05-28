import hashlib
import json

def sha256(data: str) -> str:
    return hashlib.sha256(data.encode()).hexdigest()

# --- Experiment 1: Single character change ---
msg1 = "Blockchain is secure"
msg2 = "blockchain is secure"  # lowercase 'b'

print("Hash 1:", sha256(msg1))
print("Hash 2:", sha256(msg2))
print("Same? ", sha256(msg1) == sha256(msg2))

# --- Experiment 2: Simulate a block ---
block = {
    "index": 1,
    "data": "Alice pays Bob 5 ETH",
    "previous_hash": "0" * 64
}
block_string = json.dumps(block, sort_keys=True)
print("\nBlock Hash:", sha256(block_string))
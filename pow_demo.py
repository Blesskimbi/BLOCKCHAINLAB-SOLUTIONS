import hashlib, time

def mine_block(data: str, difficulty: int) -> dict:
    prefix = "0" * difficulty
    nonce = 0
    start = time.time()
    while True:
        candidate = f"{data}{nonce}"
        h = hashlib.sha256(candidate.encode()).hexdigest()
        if h.startswith(prefix):
            elapsed = time.time() - start
            return {"nonce": nonce, "hash": h, "time": elapsed}
        nonce += 1

result = mine_block("SSBlock#1", difficulty=5)
print(f"Nonce: {result['nonce']}")
print(f"Hash:  {result['hash']}")
print(f"Time:  {result['time']:.3f}s")
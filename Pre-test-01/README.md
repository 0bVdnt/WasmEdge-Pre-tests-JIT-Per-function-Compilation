# Pre-test 01

## Problem:

### Please show the answer about the following code snippet:

```c
int result = 0;
for (int x : {4, 2, 8, 5}) {
    if (x >= 4) {
        result += x * x;
    } else {
        result -= x;
    }
}
```

### Answer: **103**

### Step by step execution trace:

1. Init: `result = 0`
2. Iteration 1(x = 4):
   - Condition `4 >= 4` is `True`
   - `result += 4 * 4` -> `result = 0 + 16 = 16`

3. Iteration 2(x = 2):
   - Condition `2 >= 4` is `False`.
   - `result -= 2` -> `result = 16 - 2 = 14`

4. Iteration 3(x = 8):
   - Condition `8 >= 4` is `True`
   - `result += 8 * 8` -> `result = 14 + 64 = 78`

5. Iteration 4 (x = 5):
   - Condition `5 >= 4` is `True`
   - `result += 5 * 5` -> `result = 78 + 25 = 103`

6. Final `result`: **103**

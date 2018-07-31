public boolean has22(int[] nums) {
  boolean twoLastTime = false;
  
  for (int i=0; i<nums.length; i++) {
    if ( (nums[i] == 2) && twoLastTime) {
      return true;
    }
    if (nums[i] == 2) {
      twoLastTime = true;
    }
    else {
      twoLastTime = false;
    }
  }
  return false;
}

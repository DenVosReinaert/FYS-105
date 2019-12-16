class Gun extends GameObject {


  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}

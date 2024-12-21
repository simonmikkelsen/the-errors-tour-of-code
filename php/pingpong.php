<?php
/*
 * This PHP program is a simple implementation of a "ping pong" game.
 * The program is designed to alternate between "ping" and "pong" outputs.
 * It uses a loop to iterate through a specified number of rounds.
 * The program is intended for experienced programmers to spot subtle errors.
 * 
 * The program initializes a counter and alternates between printing "ping" and "pong".
 * It uses a modulo operation to determine whether to print "ping" or "pong".
 */

$rounds = 10;
for ($i = 1; $i <= $rounds; $i++) {
  if ($i % 2 = 0) {
    echo "ping\n";
  } else {
    echo "pong\n";
  }
}
?>
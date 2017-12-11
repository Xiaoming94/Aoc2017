fn calc_level_of(input: i64, edge: i64) -> i64
{
    if input == 1 {
        return 0
    }
    if edge.pow(2) > input {
        return 0
    }
    else {
        return 1 + calc_level_of(input,edge + 2)
    }
}

fn calc_steps_from_middle(input: i64, level: i64) -> i64
{
    let (down,left,up,right) = find_middles(level);
    if right > input {
        return right - input;
    }
    if up > input {
        let diff_up = up - input;
        let diff_right = input - right;
        return if diff_up < diff_right {diff_up} else {diff_right};
    }
    if left > input {
        let diff_left = left - input;
        let diff_up = input - up;
        return if diff_left < diff_up {diff_left} else {diff_up};
    }
    if down > input {
        let diff_down = down - input;
        let diff_left = input - left;
        return if diff_down < diff_left {diff_down} else {diff_left};
    }
    else{
        return input - down
    }

}

fn find_middles(level: i64) -> (i64,i64,i64,i64)
{
    let biggest_edge = (1 + 2 * level).pow(2);
    let down_mid = biggest_edge - ((1 + 2 * level)/2);
    let space_diff = 2 * level;
    (down_mid,                      // Down_mid
        down_mid - space_diff,      // Left mid
        down_mid - space_diff * 2,  // Up mid
        down_mid - space_diff * 3)  // right mid
}

fn main()
{
    let input = 361527;
    let level = calc_level_of(input,1);
    println!("The level of 361527 is: {}", level);
    println!("The final answer is: {}",level + calc_steps_from_middle(input,level))

//    let input = 361527;
}

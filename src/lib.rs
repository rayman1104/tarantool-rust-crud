#[tarantool::proc]
fn easy() {
    println!("hello world");
}

#[tarantool::proc]
fn easy2() {
    println!("hello world -- easy2");
}

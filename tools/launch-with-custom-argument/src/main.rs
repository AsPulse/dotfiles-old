fn main() {
    let target = std::env::args().nth(1).unwrap();

    let mut command = std::process::Command::new(&target);

    if target.contains("vivaldi") {
        command.arg("--ozone-platform-hint=auto");
        command.arg("--gtk-version=4");
        command.arg("--enable-wayland-ime");
    }

    println!("Launching... {:?}", command);
    command.spawn().unwrap();
}


class core_tester extends testbench_base;

    function new(Logger logger, virtual pito_interface inf, string firmware="Null.hex");
        firmware = "csr.hex";
        super.new(logger, firmware, inf);
    endfunction

    task tb_setup();
        super.tb_setup();
    endtask

    task run();
        logger.print_banner("Testbench Run phase");
        fork
            this.monitor.run();
            // monitor_regs();
        join_any
    endtask

    task report();
        super.report();
    endtask

endclass


-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity transfer is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_dma_AWVALID : OUT STD_LOGIC;
    m_axi_dma_AWREADY : IN STD_LOGIC;
    m_axi_dma_AWADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_dma_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_dma_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_WVALID : OUT STD_LOGIC;
    m_axi_dma_WREADY : IN STD_LOGIC;
    m_axi_dma_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_WLAST : OUT STD_LOGIC;
    m_axi_dma_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_ARVALID : OUT STD_LOGIC;
    m_axi_dma_ARREADY : IN STD_LOGIC;
    m_axi_dma_ARADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_dma_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_dma_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_dma_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_RVALID : IN STD_LOGIC;
    m_axi_dma_RREADY : OUT STD_LOGIC;
    m_axi_dma_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_dma_RLAST : IN STD_LOGIC;
    m_axi_dma_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_BVALID : IN STD_LOGIC;
    m_axi_dma_BREADY : OUT STD_LOGIC;
    m_axi_dma_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_dma_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_dma_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    addr : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of transfer is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (16 downto 0) := "00000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (16 downto 0) := "00000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (16 downto 0) := "00000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (16 downto 0) := "00000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (16 downto 0) := "00000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (16 downto 0) := "00000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (16 downto 0) := "00001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (16 downto 0) := "00010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (16 downto 0) := "00100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (16 downto 0) := "01000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (16 downto 0) := "10000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv64_10780012 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000010000011110000000000000010010";
    constant ap_const_lv64_1078000C : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000010000011110000000000000001100";
    constant ap_const_lv64_10780016 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000010000011110000000000000010110";
    constant ap_const_lv64_1078000D : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000010000011110000000000000001101";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv32_300 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001100000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal dma_blk_n_AW : STD_LOGIC;
    signal dma_blk_n_W : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal dma_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal dma_blk_n_AR : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal dma_blk_n_R : STD_LOGIC;
    signal ap_CS_fsm_state17 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state17 : signal is "none";
    signal ap_sig_ioackin_m_axi_dma_AWREADY : STD_LOGIC;
    signal ap_sig_ioackin_m_axi_dma_WREADY : STD_LOGIC;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_reg_ioackin_m_axi_dma_AWREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_m_axi_dma_WREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_m_axi_dma_ARREADY : STD_LOGIC := '0';
    signal ap_sig_ioackin_m_axi_dma_ARREADY : STD_LOGIC;
    signal tmp_fu_140_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (16 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_dma_ARREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_dma_ARREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state10)) then
                    if ((ap_sig_ioackin_m_axi_dma_ARREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_m_axi_dma_ARREADY <= ap_const_logic_0;
                    elsif ((m_axi_dma_ARREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_m_axi_dma_ARREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_dma_AWREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_dma_AWREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io)) or (not(((ap_start = ap_const_logic_0) or (ap_sig_ioackin_m_axi_dma_AWREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_io)))) then 
                    ap_reg_ioackin_m_axi_dma_AWREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_dma_AWREADY = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (m_axi_dma_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((m_axi_dma_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
                    ap_reg_ioackin_m_axi_dma_AWREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_dma_WREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_dma_WREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io)) or ((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_sig_ioackin_m_axi_dma_WREADY = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_io)))) then 
                    ap_reg_ioackin_m_axi_dma_WREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_dma_WREADY = ap_const_logic_1)) or ((m_axi_dma_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((m_axi_dma_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
                    ap_reg_ioackin_m_axi_dma_WREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, m_axi_dma_RVALID, m_axi_dma_BVALID, ap_CS_fsm_state2, ap_CS_fsm_state7, ap_CS_fsm_state3, ap_CS_fsm_state8, ap_CS_fsm_state4, ap_CS_fsm_state9, ap_CS_fsm_state10, ap_CS_fsm_state17, ap_sig_ioackin_m_axi_dma_AWREADY, ap_sig_ioackin_m_axi_dma_WREADY, ap_block_state2_io, ap_block_state3_io, ap_sig_ioackin_m_axi_dma_ARREADY, tmp_fu_140_p3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_sig_ioackin_m_axi_dma_AWREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_io))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_sig_ioackin_m_axi_dma_WREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                if (((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state7))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                if (((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if (((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state10 => 
                if (((ap_sig_ioackin_m_axi_dma_ARREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                if (((m_axi_dma_RVALID = ap_const_logic_1) and (tmp_fu_140_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((m_axi_dma_RVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state17) and (tmp_fu_140_p3 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state17;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state17 <= ap_CS_fsm(16);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_block_state2_io_assign_proc : process(ap_sig_ioackin_m_axi_dma_AWREADY, ap_sig_ioackin_m_axi_dma_WREADY)
    begin
                ap_block_state2_io <= ((ap_sig_ioackin_m_axi_dma_WREADY = ap_const_logic_0) or (ap_sig_ioackin_m_axi_dma_AWREADY = ap_const_logic_0));
    end process;


    ap_block_state3_io_assign_proc : process(ap_sig_ioackin_m_axi_dma_AWREADY, ap_sig_ioackin_m_axi_dma_WREADY)
    begin
                ap_block_state3_io <= ((ap_sig_ioackin_m_axi_dma_WREADY = ap_const_logic_0) or (ap_sig_ioackin_m_axi_dma_AWREADY = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_dma_RVALID, ap_CS_fsm_state17, tmp_fu_140_p3)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((m_axi_dma_RVALID = ap_const_logic_1) and (tmp_fu_140_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axi_dma_RVALID, ap_CS_fsm_state17, tmp_fu_140_p3)
    begin
        if (((m_axi_dma_RVALID = ap_const_logic_1) and (tmp_fu_140_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_dma_ARREADY_assign_proc : process(m_axi_dma_ARREADY, ap_reg_ioackin_m_axi_dma_ARREADY)
    begin
        if ((ap_reg_ioackin_m_axi_dma_ARREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_dma_ARREADY <= m_axi_dma_ARREADY;
        else 
            ap_sig_ioackin_m_axi_dma_ARREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_dma_AWREADY_assign_proc : process(m_axi_dma_AWREADY, ap_reg_ioackin_m_axi_dma_AWREADY)
    begin
        if ((ap_reg_ioackin_m_axi_dma_AWREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_dma_AWREADY <= m_axi_dma_AWREADY;
        else 
            ap_sig_ioackin_m_axi_dma_AWREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_dma_WREADY_assign_proc : process(m_axi_dma_WREADY, ap_reg_ioackin_m_axi_dma_WREADY)
    begin
        if ((ap_reg_ioackin_m_axi_dma_WREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_dma_WREADY <= m_axi_dma_WREADY;
        else 
            ap_sig_ioackin_m_axi_dma_WREADY <= ap_const_logic_1;
        end if; 
    end process;


    dma_blk_n_AR_assign_proc : process(m_axi_dma_ARREADY, ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            dma_blk_n_AR <= m_axi_dma_ARREADY;
        else 
            dma_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    dma_blk_n_AW_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_dma_AWREADY, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            dma_blk_n_AW <= m_axi_dma_AWREADY;
        else 
            dma_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    dma_blk_n_B_assign_proc : process(m_axi_dma_BVALID, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            dma_blk_n_B <= m_axi_dma_BVALID;
        else 
            dma_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    dma_blk_n_R_assign_proc : process(m_axi_dma_RVALID, ap_CS_fsm_state17)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            dma_blk_n_R <= m_axi_dma_RVALID;
        else 
            dma_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;


    dma_blk_n_W_assign_proc : process(m_axi_dma_WREADY, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            dma_blk_n_W <= m_axi_dma_WREADY;
        else 
            dma_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    m_axi_dma_ARADDR <= ap_const_lv64_1078000D(32 - 1 downto 0);
    m_axi_dma_ARBURST <= ap_const_lv2_0;
    m_axi_dma_ARCACHE <= ap_const_lv4_0;
    m_axi_dma_ARID <= ap_const_lv1_0;
    m_axi_dma_ARLEN <= ap_const_lv32_1;
    m_axi_dma_ARLOCK <= ap_const_lv2_0;
    m_axi_dma_ARPROT <= ap_const_lv3_0;
    m_axi_dma_ARQOS <= ap_const_lv4_0;
    m_axi_dma_ARREGION <= ap_const_lv4_0;
    m_axi_dma_ARSIZE <= ap_const_lv3_0;
    m_axi_dma_ARUSER <= ap_const_lv1_0;

    m_axi_dma_ARVALID_assign_proc : process(ap_CS_fsm_state10, ap_reg_ioackin_m_axi_dma_ARREADY)
    begin
        if (((ap_reg_ioackin_m_axi_dma_ARREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            m_axi_dma_ARVALID <= ap_const_logic_1;
        else 
            m_axi_dma_ARVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_dma_AWADDR_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_reg_ioackin_m_axi_dma_AWREADY)
    begin
        if ((ap_reg_ioackin_m_axi_dma_AWREADY = ap_const_logic_0)) then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                m_axi_dma_AWADDR <= ap_const_lv64_10780016(32 - 1 downto 0);
            elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                m_axi_dma_AWADDR <= ap_const_lv64_1078000C(32 - 1 downto 0);
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                m_axi_dma_AWADDR <= ap_const_lv64_10780012(32 - 1 downto 0);
            else 
                m_axi_dma_AWADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            m_axi_dma_AWADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_dma_AWBURST <= ap_const_lv2_0;
    m_axi_dma_AWCACHE <= ap_const_lv4_0;
    m_axi_dma_AWID <= ap_const_lv1_0;
    m_axi_dma_AWLEN <= ap_const_lv32_1;
    m_axi_dma_AWLOCK <= ap_const_lv2_0;
    m_axi_dma_AWPROT <= ap_const_lv3_0;
    m_axi_dma_AWQOS <= ap_const_lv4_0;
    m_axi_dma_AWREGION <= ap_const_lv4_0;
    m_axi_dma_AWSIZE <= ap_const_lv3_0;
    m_axi_dma_AWUSER <= ap_const_lv1_0;

    m_axi_dma_AWVALID_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_reg_ioackin_m_axi_dma_AWREADY)
    begin
        if ((((ap_reg_ioackin_m_axi_dma_AWREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_reg_ioackin_m_axi_dma_AWREADY = ap_const_logic_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_reg_ioackin_m_axi_dma_AWREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            m_axi_dma_AWVALID <= ap_const_logic_1;
        else 
            m_axi_dma_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_dma_BREADY_assign_proc : process(m_axi_dma_BVALID, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if ((((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9)) or ((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((m_axi_dma_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state7)))) then 
            m_axi_dma_BREADY <= ap_const_logic_1;
        else 
            m_axi_dma_BREADY <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_dma_RREADY_assign_proc : process(m_axi_dma_RVALID, ap_CS_fsm_state17)
    begin
        if (((m_axi_dma_RVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
            m_axi_dma_RREADY <= ap_const_logic_1;
        else 
            m_axi_dma_RREADY <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_dma_WDATA_assign_proc : process(addr, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_reg_ioackin_m_axi_dma_WREADY)
    begin
        if ((ap_reg_ioackin_m_axi_dma_WREADY = ap_const_logic_0)) then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                m_axi_dma_WDATA <= ap_const_lv32_300;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                m_axi_dma_WDATA <= ap_const_lv32_1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                m_axi_dma_WDATA <= addr;
            else 
                m_axi_dma_WDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            m_axi_dma_WDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_dma_WID <= ap_const_lv1_0;
    m_axi_dma_WLAST <= ap_const_logic_0;
    m_axi_dma_WSTRB <= ap_const_lv4_F;
    m_axi_dma_WUSER <= ap_const_lv1_0;

    m_axi_dma_WVALID_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_reg_ioackin_m_axi_dma_WREADY)
    begin
        if ((((ap_reg_ioackin_m_axi_dma_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_reg_ioackin_m_axi_dma_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((ap_reg_ioackin_m_axi_dma_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            m_axi_dma_WVALID <= ap_const_logic_1;
        else 
            m_axi_dma_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_140_p3 <= m_axi_dma_RDATA(1 downto 1);
end behav;

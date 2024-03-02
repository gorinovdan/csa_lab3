import contextlib
import io
import logging
import os
import tempfile

import pytest
import translator
import machine


@pytest.mark.golden_test("golden\*.yml")
def test_translator_and_machine(golden, caplog):
    caplog.set_level(logging.INFO)

    with tempfile.TemporaryDirectory() as tmpdirname:
        source = os.path.join(tmpdirname, "source.alg")
        input_stream = os.path.join(tmpdirname, "input.txt")
        target_json = os.path.join(tmpdirname, "target.json")
        target_bin = os.path.join(tmpdirname, "target.bin")

        with open(source, "w", encoding="utf-8") as file:
            file.write(golden["in_source"])
        with open(input_stream, "w", encoding="utf-8") as file:
            file.write(golden["in_stdin"])

        with contextlib.redirect_stdout(io.StringIO()) as stdout:
            translator.main([source, target_json, target_bin])
            print("============================================================")
            machine.main([target_bin, input_stream])

        with open(target_json, encoding="utf-8") as file:
            code = file.read()

        assert code == golden.out["out_code"]
        assert stdout.getvalue() == golden.out["out_stdout"]
        assert caplog.text == golden.out["out_log"]

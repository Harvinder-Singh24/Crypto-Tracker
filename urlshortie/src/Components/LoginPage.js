import React, { useState } from "react";
import {
  Box,
  Button,
  InputGroup,
  InputLeftElement,
  Stack,
  Text,
} from "@chakra-ui/react";
import { Input } from "@chakra-ui/react";
import { SiGmail } from "react-icons/si";
import { RiLockPasswordFill } from "react-icons/ri";
import { FaUser } from "react-icons/fa";

export default function LoginPage() {
  return (
    <>
      <Box w={500} h={500} bg="white" boxShadow="2xl" borderRadius={10}>
        <Stack direction="column" p={30} spacing={3}>
          <Text fontSize="30" fontFamily="Koulen, sans-serif">
            Sign Up
          </Text>
          <Stack direction="column" p={30}>
            <InputGroup>
              <InputLeftElement
                pointerEvents="none"
                children={<FaUser />}
              ></InputLeftElement>
              <Input variant="filled" placeholder="Name" />
            </InputGroup>

            <InputGroup>
              <InputLeftElement
                pointerEvents="none"
                children={<SiGmail />}
              ></InputLeftElement>
              <Input variant="filled" placeholder="Email" />
            </InputGroup>

            <InputGroup>
              <InputLeftElement
                pointerEvents="none"
                children={<RiLockPasswordFill />}
              ></InputLeftElement>
              <Input variant="filled" placeholder="Password" />
            </InputGroup>

            <InputGroup>
              <InputLeftElement
                pointerEvents="none"
                children={<RiLockPasswordFill />}
              ></InputLeftElement>
              <Input variant="filled" placeholder="Confirm Password" />
            </InputGroup>
          </Stack>
          <Stack direction="column">
            <Button bg="#85586F" color="white">
              Sign Up
            </Button>
            <Text textAlign="center">----------Or------------</Text>
            <Button bg="#85586F" color="white">
              Sign In
            </Button>
          </Stack>
        </Stack>
      </Box>
    </>
  );
}

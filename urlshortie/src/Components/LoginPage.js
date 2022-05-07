import React from "react";
import {
  Box,
  InputGroup,
  InputLeftElement,
  Stack,
  Text,
} from "@chakra-ui/react";
import { Input } from "@chakra-ui/react";
import { SiGmail } from "react-icons/si";
import {RiLockPasswordFill} from 'react-icons/ri'

export default function LoginPage() {
  return (
    <>
      <Box w={500} h={500} bg="white" boxShadow="2xl" borderRadius={10}>
        <Stack direction="column" p={30} spacing="30">
          <Text fontSize="30" fontFamily="Koulen, sans-serif">
            Sign Up
          </Text>
          <Stack direction="column" p={30}>

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


          </Stack>

        </Stack>
      </Box>
    </>
  );
}
